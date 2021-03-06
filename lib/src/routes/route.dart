import 'package:flutter/material.dart';
import 'package:galaspace/src/pages/chat_page.dart';
import 'package:galaspace/src/pages/home_page.dart';
import 'package:galaspace/src/pages/login_page.dart';
import 'package:galaspace/src/pages/messages_page.dart';
import 'package:galaspace/src/pages/perfilOtroUser_page.dart';
import 'package:galaspace/src/pages/perfilUser_page.dart';
import 'package:galaspace/src/pages/registro_page.dart';
import 'package:galaspace/src/pages/search_page.dart';
import 'package:galaspace/src/pages/settings_page.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    'Login': (BuildContext context) => LoginPage(),
    'Registro': (BuildContext context) => RegistroPage(),
    'Home': (BuildContext context) => HomePage(),
    'Search': (BuildContext context) => SearchPage(),
    'Settings': (BuildContext context) => SettingsPage(),
    'Perfil': (BuildContext context) => PerfilUsuarioPage(),
    'Messages': (BuildContext context) => MessagesPages(),
    'OPerfil': (BuildContext context) => PerfilOtroUsuarioPage(),
    'ChatUsuario': (BuildContext context) => ChatUsuarioPage(),
  };
}
