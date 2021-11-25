import 'package:flutter/material.dart';
import 'package:galaspace/src/pages/home_page.dart';

import 'package:galaspace/src/pages/login_page.dart';
import 'package:galaspace/src/pages/perfilUser_page.dart';
import 'package:galaspace/src/pages/registro_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'Login': (BuildContext context) => LoginPage(),
    'Registro': (BuildContext context) => RegistroPage(),
    'Home': (BuildContext context) => HomePage(),
    'Perfil': (BuildContext context) => PerfilUsuarioPage(),
  };
}
