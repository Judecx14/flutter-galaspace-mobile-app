import 'package:flutter/material.dart';

class ChatUsuarioPage extends StatefulWidget {
  @override
  _ChatUsuarioPageState createState() => _ChatUsuarioPageState();
}

class _ChatUsuarioPageState extends State<ChatUsuarioPage> {
  Color _color_btn = Color.fromRGBO(92, 78, 154, 1);
  double _chat = 560;

  Icon _icono = Icon(
    Icons.person_add,
    color: Colors.white,
    size: 25,
  );

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    print(_screenSize);
    //final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 239, 239, 1),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        flexibleSpace:
            _crearAppBar(context, "Samantha Reyes"), //fromRGBO(92, 78, 154, 1),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Container(
            height: _chat,
            child: ListView(
              padding: EdgeInsets.only(left: 15, right: 15),
              children: <Widget>[
                _mensajeFriend(context, "Hola, Como estas ?"),
                _mensajePropio(context, "Hola, Bien y tu ?"),
                _mensajeFriend(context, "Que haces?"),
                _mensajePropio(context, "Hola, Bien y tu ?"),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            height: 93.0,
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 281,
                      child: TextField(
                        autofocus: false,
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(
                          hoverColor: _color_btn,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: 'Escribir Mensaje',
                        ),
                        onChanged: (valor) {
                          setState(() {});

                          //print(_nombre);
                        },
                        onTap: () {
                          setState(() {
                            _chat = 310;
                          });
                        },
                      ),
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.pushReplacementNamed(
                              context, 'ChatUsuario');
                        });
                      },
                      child: Icon(
                        Icons.send,
                        size: 40,
                        color: _color_btn,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _crearAppBar(BuildContext context, String title) {
    return Container(
      height: 84.0,
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              child: Container(
                //color: Colors.red,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Color.fromRGBO(92, 78, 154, 1),

                      //=> Navigator.pushReplacementNamed(context, 'Login'),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/img/friend.jpg"),
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.pushReplacementNamed(context, 'OPerfil'),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Color.fromRGBO(92, 78, 154, 1), fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  Widget _mensajeFriend(BuildContext context, String mns) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(231, 31, 118, 0.26),
      ),
      margin: EdgeInsets.only(top: 20, right: 160),
      padding: EdgeInsets.only(top: 10, left: 20),
      height: 40.0,
      child: Text(
        mns,
        style:
            TextStyle(color: Colors.black, fontFamily: 'Arial', fontSize: 15),
      ),
    );
  }

  Widget _mensajePropio(BuildContext context, String mns) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(98, 78, 154, 1),
      ),
      margin: EdgeInsets.only(top: 30, left: 160),
      padding: EdgeInsets.only(top: 10, left: 70),
      width: 70,
      height: 40,
      child: Text(
        mns,
        style:
            TextStyle(color: Colors.white, fontFamily: 'Arial', fontSize: 15),
      ),
    );
  }
}
