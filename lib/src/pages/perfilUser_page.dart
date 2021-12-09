import 'package:flutter/material.dart';
import 'package:galaspace/src/pages/login_page.dart';
import 'package:galaspace/src/widgets/post_card.dart';

class PerfilUsuarioPage extends StatefulWidget {
  @override
  _PerfilUsuarioPageState createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilUsuarioPage> {
  Color _color_btn = Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);

  Icon _icono = Icon(
    Icons.camera_alt,
    color: Colors.white,
    size: 28,
  );

  @override
  Widget build(BuildContext context) {
    //final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white, //fromRGBO(92, 78, 154, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color.fromRGBO(92, 78, 154, 1),
            tooltip: 'Atras',
            onPressed: () {
              print('Hola mundo');
              Navigator.pop(context);
            }),
        centerTitle: false,
        //backgroundColor: Colors.brown[900],
        title: Text(
          'Perfil',
          style:
              TextStyle(color: Color.fromRGBO(92, 78, 154, 1), fontSize: 18.0),
        ),
        actions: [_popUpMenu()],
      ),
      body: ListView(
        children: [
          //_crearAppBar(context, 'Perfil'),
          _imgUser(context),
          PostCard(
            isMine: true,
            withImage: false,
          ),
          PostCard(
            isMine: true,
            withImage: true,
          ),
          PostCard(
            isMine: true,
            withImage: true,
          ),
        ],
      ),
    );
  }

  Widget _imgUser(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        Stack(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 100,
              backgroundImage: AssetImage('assets/img/me.jpeg'),
            ),
            GestureDetector(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.only(
                  top: 110,
                  left: 150,
                ),
                child: CircleAvatar(
                  minRadius: 35,
                  maxRadius: 35,
                  //radius: 20,
                  backgroundColor: _color_btn,
                  child: _icono,
                ),
              ),
              onTap: () async {
                print('hola mundo ');
                /*setState(() {
                  _color_btn = Colors.white;
                  _icono = Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 45,
                  );
                });*/

                //final source = await showImageSource(context);
                //if (source == null) return;

                //onClicked(source);
              }, //=> pickImaage(ImageSource.gallery),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        _crearBoton(context),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'Steve Jobs',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(92, 78, 154, 1),
          ),
        ),
        Text(
          '¡La vida es Buena!',
          style: TextStyle(
            fontSize: 14,
            color: Color.fromRGBO(92, 78, 154, 1),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }

  Widget _crearBoton(BuildContext context) {
    //fromValidStream
    return ElevatedButton(
      child: Container(
        width: 210.0,
        height: 40.0,
        //padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Center(
            child: Text(
          'Editar Perfil',
          style: TextStyle(
              fontSize: 25.0 /*, color: Color.fromRGBO(92, 78, 154, 1)*/),
        )),
      ),
      style: ButtonStyle(
        foregroundColor:
            getColor(Color.fromRGBO(231, 31, 118, 1), Colors.white),
        backgroundColor: getColor(
            Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(231, 31, 118, 1)),
        side: getBorde(Color.fromRGBO(231, 31, 118, 1), Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: Colors.red)),
        ),
      ),

      /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Colors.white,
      textColor: Colors.white,*/
      onPressed: () {
        print('Hola mundo');
        //Navigator.pushReplacementNamed(context, 'Perfil');
        //Navigator.pushNamed(context, 'Perfil');
      },
    );
  }

  MaterialStateProperty<Color> getColor(Color color, Color colorPresionado) {
    final getColor = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return colorPresionado;
      } else {
        return color;
      }
    };

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorde(
      Color color, Color colorPresionado) {
    final getBorde = (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(color: colorPresionado, width: 2);
      } else {
        return BorderSide(color: color, width: 2);
      }
    };

    return MaterialStateProperty.resolveWith(getBorde);
  }

  PopupMenuButton _popUpMenu() {
    return PopupMenuButton(
      onSelected: (value) {
        if (value == 0) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      LoginPage())); //Navigator.pushReplacementNamed(context, 'Login')
        } else {
          print("hola mundo");
        }
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      icon: Icon(
        Icons.more_vert,
        color: _color_btn,
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 0,
          child: ListTile(
            trailing: Icon(Icons.logout),
            title: Text(
              'Cerrar Sesión',
              style: TextStyle(
                fontFamily: 'Arial',
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
