import 'package:flutter/material.dart';
import 'package:galaspace/src/pages/login_page.dart';
import 'package:galaspace/src/providers/ui_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: purple),
      ),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configuración',
              style: TextStyle(
                color: purple,
                fontFamily: 'ArialRoundedMTBold',
                fontSize: 25.0,
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'Perfil');
              },
              child: _OptionCard(
                color: purple,
                label: 'Revisa tu información o edita tus datos',
                icon: Icons.person,
                title: 'Perfil de usuario',
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            GestureDetector(
              onTap: () {
                final providerfriend =
                    Provider.of<UiProvider>(context, listen: false);

                providerfriend.selectedOptionMenu = 1;

                Navigator.pushNamed(context, 'Messages');
              },
              child: _OptionCard(
                color: pink,
                label: 'Revisa la lista de tus amigos',
                icon: Icons.group,
                title: 'Lista de amigos',
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            _OptionCard(
              color: blue,
              label: 'Revisa tu lista de solicitudes de amistad',
              icon: Icons.group_add,
              title: 'Solicitudes de amistad',
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginPage()));
              },
              child: _OptionCard(
                color: Colors.black12,
                label: 'Puedes cerrar sesión y regresar cuando deeses',
                icon: Icons.indeterminate_check_box,
                title: 'Cerrar sesion',
                colorText: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OptionCard extends StatelessWidget {
  const _OptionCard({
    Key? key,
    required this.color,
    required this.label,
    required this.title,
    required this.icon,
    //required this.txtTitle,
    this.colorText,
  }) : super(key: key);

  final Color color;
  final String label;
  final String title;
  final IconData icon;
  final Color? colorText;
  //final String txtTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              label,
              style: TextStyle(
                color: colorText ?? Colors.white70,
              ),
            ),
            trailing: Icon(
              icon,
              color: colorText ?? Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15.0),
            child: Text(
              title,
              style: TextStyle(
                color: colorText ?? Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
                fontSize: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
