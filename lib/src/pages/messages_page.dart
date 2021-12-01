import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesPages extends StatelessWidget {
  const MessagesPages({Key? key}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: purple,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            'Mensajes',
            style: TextStyle(color: purple, fontFamily: 'Arial'),
          ),
        ),
        body: const _MessagesBody(),
        bottomNavigationBar: _BottomNavigationBarCustom(pink: pink));
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
          onTap: (int index) {},
        ),
      ),
    );
  }
}

class _MessagesBody extends StatelessWidget {
  const _MessagesBody({Key? key}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const _SearchBar(),
            const SizedBox(
              height: 25.0,
            ),
            _ItemMessage(),
            const SizedBox(
              height: 25.0,
            ),
            _ItemMessage(),
            const SizedBox(
              height: 25.0,
            ),
            _ItemMessage(isRead: true),
            const SizedBox(
              height: 25.0,
            ),
            _ItemMessage(isRead: true),
            const SizedBox(
              height: 25.0,
            ),
            _ItemMessage(),
            const SizedBox(
              height: 25.0,
            ),
            _ItemMessage(isRead: true),
          ],
        ),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10.0,
      ),
      placeholder: 'Buscar',
      borderRadius: BorderRadius.circular(100.0),
      placeholderStyle: const TextStyle(
        fontFamily: 'Arial',
        color: Colors.grey,
        fontSize: 15.0,
      ),
    );
  }
}

class _ItemMessage extends StatelessWidget {
  _ItemMessage({Key? key, this.isRead = false}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);
  bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0),
            blurRadius: 7.5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage('assets/img/friend.jpg'),
            ),
            title: Text(
              'Hailee Steinfeld',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'Arial',
                color: purple,
              ),
            ),
            trailing: isRead
                ? null
                : Icon(
                    Icons.circle,
                    color: pink,
                    size: 15.0,
                  ),
            subtitle: Text(
              'Hola, como te encunetras?',
              style: TextStyle(
                fontFamily: 'Arial',
                color: isRead ? null : Colors.black,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            child: const Text(
              '22:00 PM',
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Arial',
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
