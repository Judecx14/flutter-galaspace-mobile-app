import 'package:flutter/material.dart';
import 'package:galaspace/src/widgets/post_card.dart';

class PerfilOtroUsuarioPage extends StatefulWidget {
  @override
  _PerfilUsuarioPageState createState() => _PerfilUsuarioPageState();
}

class _PerfilUsuarioPageState extends State<PerfilOtroUsuarioPage> {
  Color _color_btn = Color.fromRGBO(92, 78, 154, 1);

  Icon _icono = Icon(
    Icons.person_add,
    color: Colors.white,
    size: 25,
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
        /*actions: [
          IconButton(
              icon: Icon(Icons.more_vert_rounded),
              color: Color.fromRGBO(92, 78, 154, 1),
              tooltip: 'Configuracion',
              onPressed: () {
                print('Hola mundo');
              }),
        ],*/
      ),
      body: ListView(
        children: [
          //_crearAppBar(context, 'Perfil'),
          _imgUser(context),
          PostCard(
            isMine: false,
            withImage: true,
          ),
          PostCard(
            isMine: false,
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
              /*decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.red,
              ),
              alignment: Alignment.center,
              height: 203,
              width: 203,*/
              backgroundImage: AssetImage('assets/img/friend.jpg'),
              /*FadeInImage(
                image: AssetImage('assets/img/friend.jpg'),
                placeholder: AssetImage('assets/img/loading.gif'),
                fadeInDuration: Duration(milliseconds: 300),
                fit: BoxFit.cover,
              ),*/
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
                setState(() {
                  _color_btn = Colors.white;
                  _icono = Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 45,
                  );
                });

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
          'Hailee Steinfeld',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(92, 78, 154, 1),
          ),
        ),
        Text(
          'believe yourself',
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
          'Enviar mensaje',
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
        //Navigator.pushReplacementNamed(context, 'ChatUsuario');
        Navigator.pushNamed(context, 'ChatUsuario');
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
}
