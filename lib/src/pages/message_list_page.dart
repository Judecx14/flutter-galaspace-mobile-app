import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:galaspace/src/providers/search_provider.dart';
import 'package:galaspace/src/widgets/contact_item.dart';
import 'package:provider/provider.dart';

class MessagesBody extends StatelessWidget {
  const MessagesBody({Key? key}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const _SearchBar(),
            const SizedBox(
              height: 25.0,
            ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(isRead: true),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(isRead: true),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(isRead: true),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              _ItemMessage(),
            if (!Provider.of<SearchContactProvider>(context).showResults)
              const SizedBox(
                height: 25.0,
              ),
            if (Provider.of<SearchContactProvider>(context).showResults)
              const ContactItem(),
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
    final searchProvider = Provider.of<SearchContactProvider>(context);

    return CupertinoSearchTextField(
      autofocus: false,
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
      onChanged: (value) {
        if (value.isEmpty) {
          searchProvider.showResultsValue = false;
        } else if (value.isNotEmpty) {
          searchProvider.showResultsValue = true;
        }
      },
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
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'ChatUsuario');
      },
      child: Container(
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
      ),
    );
  }
}
