import 'package:flutter/material.dart';
import 'package:galaspace/src/providers/search_provider.dart';
import 'package:galaspace/src/providers/ui_provider.dart';

//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:componentes/src/pages/home_temp.dart';
import 'package:galaspace/src/routes/route.dart';
import 'package:provider/provider.dart';
//import 'package:componentes/src/pages/card_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => SearchContactProvider()),
      ],
      child: MaterialApp(
        color: const Color.fromRGBO(62, 38, 105, 1),
        //theme: ThemeData.light(),
        title: 'Componentes App',
        debugShowCheckedModeBanner: false,
        //home: HomePage(),
        initialRoute: 'Login',
        routes: getRoutes(),
        /*onGenerateRoute: (setting) {
          print('Ruta llamda: ${setting.name}');
    
          return MaterialPageRoute(builder: (BuildContext context) => CardPage());
        },*/
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
      ),
    );
  }
}
