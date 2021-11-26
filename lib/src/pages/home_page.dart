import 'package:flutter/material.dart';
import 'package:galaspace/src/pages/search_page.dart';
import 'package:galaspace/src/pages/settings_page.dart';
import 'package:galaspace/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final Color purple = const Color.fromRGBO(92, 78, 154, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65.0,
        backgroundColor: purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15.0),
          ),
        ),
        title: const Text(
          'Publicaciones',
          style: TextStyle(fontFamily: 'ArialRoundedMTBold'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.message,
                  color: purple,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          PostCard(
            isMine: false,
            withImage: false,
          ),
          PostCard(
            isMine: true,
            withImage: true,
          ),
          PostCard(
            isMine: false,
            withImage: true,
          ),
        ],
      ),
      bottomNavigationBar: _BottomNavigationBarCustom(purple: purple),
    );
  }
}

class _BottomNavigationBarCustom extends StatelessWidget {
  const _BottomNavigationBarCustom({
    Key? key,
    required this.purple,
  }) : super(key: key);

  final Color purple;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 1),
            blurRadius: 15.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: purple,
          elevation: 0.0,
          iconSize: 30.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu,
              ),
              label: 'Menú',
            ),
          ],
          onTap: (int index) {
            Navigator.push(context, _createRoute(index));
          },
        ),
      ),
    );
  }

  Route _createRoute(int index) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        switch (index) {
          case 0:
            return const HomePage();
          case 1:
            return const SearchPage();
          case 2:
            return const SettingsPage();
          default:
            return const HomePage();
        }
      },
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
