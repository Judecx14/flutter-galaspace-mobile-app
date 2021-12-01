import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:galaspace/src/providers/search_provider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          iconTheme: IconThemeData(color: purple),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider(
            create: (_) => SearchProvider(),
            child: _SearchContent(
              purple: purple,
              pink: pink,
            ),
          ),
          /* child: _SearchContent(purple: purple), */
        ));
  }
}

class _SearchContent extends StatelessWidget {
  const _SearchContent({
    Key? key,
    required this.purple,
    required this.pink,
  }) : super(key: key);

  final Color purple;
  final Color pink;

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Buscar personas',
          style: TextStyle(
            color: purple,
            fontFamily: 'ArialRoundedMTBold',
            fontSize: 25.0,
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        const _SearchBar(),
        if (!searchProvider.showResults) const _NoneSearch(),
        if (searchProvider.showResults)
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: const Text(
              'Resultados',
              style: TextStyle(
                fontSize: 17.5,
                color: Colors.black87,
                fontFamily: 'Arial',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (searchProvider.showResults) _ItemResult(pink: pink)
      ],
    );
  }
}

class _ItemResult extends StatelessWidget {
  const _ItemResult({
    Key? key,
    required this.pink,
  }) : super(key: key);
  final Color pink;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 20.0),
      height: 80.0,
      decoration: _itemDecoration(),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/img/friend.jpg'),
        ),
        title: const Text(
          'Hailee Steinfeld',
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Arial',
            color: Colors.grey,
          ),
        ),
        trailing: ClipOval(
          child: Material(
            color: Colors.transparent,
            child: IconButton(
              icon: const Icon(Icons.person_add),
              color: pink,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _itemDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0),
            blurRadius: 10.0,
          )
        ],
      );
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 10.0,
      ),
      placeholder: 'Escribe el nombre de un usuario',
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

class _NoneSearch extends StatelessWidget {
  const _NoneSearch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.person_add_alt,
              size: 50.0,
              color: Colors.black12,
            ),
            Text(
              'Encuentra personas',
              style: TextStyle(
                fontFamily: 'Arial',
                color: Colors.black12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
