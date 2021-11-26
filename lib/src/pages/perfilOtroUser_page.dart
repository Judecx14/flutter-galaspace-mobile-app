import 'package:flutter/material.dart';

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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white, //fromRGBO(92, 78, 154, 1),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Color.fromRGBO(92, 78, 154, 1),
            tooltip: 'Atras',
            onPressed: () {
              print('Hola mundo');
              Navigator.pushReplacementNamed(context, 'Login');
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
          Container(
            color: Colors.redAccent,
            child: Center(
              child: Text('Hola mundo'),
            ),
            height: 900.0,
          ),
        ],
      ),

      /* CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(context, 'Perfil'),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.redAccent,
                child: Center(
                  child: Text('Hola mundo'),
                ),
                height: 900.0,
              )
              /*_posterTitulo(context, pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _descripcion(pelicula),
              _crearCasting(pelicula),*/
            ]),
          ),
        ],
      ),*/
    );
  }

  Widget _crearAppBar(BuildContext context, String title) {
    return Container(
      height: 60.0,
      child: Row(
        children: <Widget>[
          IconButton(
            color: Color.fromRGBO(92, 78, 154, 1),
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, 'Login'),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            title,
            style: TextStyle(
                color: Color.fromRGBO(92, 78, 154, 1), fontSize: 18.0),
          ),
        ],
      ),
    );
    /*SliverAppBar(
      elevation: 2.0,
      backgroundColor: Color.fromRGBO(92, 78, 154, 1),
      expandedHeight: 60.0,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: 'Atras',
            onPressed: () {
              print('Hola mundo');
            }),
        Center(
          child: Text(
            //pelicula.title,
            'Perfil',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
        ),
        IconButton(
            icon: Icon(Icons.more_vert_rounded),
            tooltip: 'Configuracion',
            onPressed: () {
              print('Hola mundo');
            }),
      ],
    );*/
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
            Container(
              alignment: Alignment.center,
              height: 203,
              width: 203,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  child:
                      /*(image != null) == true
                      ? Image.file(
                          image,
                          width: 200,
                          height: 200,
                          fit: BoxFit.cover,
                        )
                      : */
                      FadeInImage(
                    image: NetworkImage(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQh9j5Wq2W_i-4SWqyUK00_c0u9yEVg4f6AGw&usqp=CAU',
                      //'https://image.flaticon.com/icons/png/512/16/16363.png',
                    ),
                    placeholder: AssetImage('assets/img/loading.gif'),
                    fadeInDuration: Duration(milliseconds: 300),
                  ),
                ),
              ),
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
          'Hola Mundo',
          style: TextStyle(
            fontSize: 24,
            color: Color.fromRGBO(92, 78, 154, 1),
          ),
        ),
        Text(
          'Hola Mundo',
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
