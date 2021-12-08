import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaspace/src/pages/contatcs_page.dart';
import 'package:galaspace/src/pages/message_list_page.dart';
import 'package:galaspace/src/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class MessagesPages extends StatelessWidget {
  const MessagesPages({Key? key}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: purple,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Mensajes',
          style: TextStyle(color: purple, fontFamily: 'Arial'),
        ),
      ),
      body: const _MessagePageBody(),
      bottomNavigationBar: _BottomNavigationBarCustom(pink: pink),
    );
  }
}

class _MessagePageBody extends StatelessWidget {
  const _MessagePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedOptionMenu;
    switch (currentIndex) {
      case 0:
        return const MessagesBody();
      case 1:
        return const ContactPage();
      default:
        return const MessagesBody();
    }
  }
}

class _BottomNavigationBarCustom extends StatelessWidget {
  const _BottomNavigationBarCustom({
    Key? key,
    required this.pink,
  }) : super(key: key);

  final Color pink;

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedOptionMenu;

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
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(fontFamily: 'Arial'),
          selectedItemColor: pink,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Mensajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Personas',
            ),
          ],
          onTap: (int index) {
            uiProvider.selectedOptionMenu = index;
          },
        ),
      ),
    );
  }
}
