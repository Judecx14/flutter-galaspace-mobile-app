import 'dart:math';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:galaspace/src/utils/utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '', _password = '';
  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(92, 78, 154, 1),
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 10.0,
              ),
              _loginForm(context),
              SizedBox(
                height: 30.0,
              ),
            ]),
          ),
        ],
      ),
    );

    //Vista antogua
    /*return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        toolbarHeight: 300.0,

        //title: _crearFondo(context),
        flexibleSpace: _crearFondo(context),
      ),
      backgroundColor: Color.fromRGBO(92, 78, 154, 1),
      body: Stack(
        children: [
          //_crearFondo(context),
          _loginForm(context),
        ],
      ),
    );*/
  }

  Widget _crearAppBar() {
    return SliverAppBar(
      backgroundColor: Color.fromRGBO(92, 78, 154, 1),
      expandedHeight: 290.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        //centerTitle: true,

        background: _crearFondo(context),
      ),
      //_crearFondo(context),
    );
  }

  Widget _crearFondo(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    /*final fondo_morado = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(color: Color.fromRGBO(92, 78, 154, 1)),
    );*/

    /*final circulo = Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );*/

    final forma_fondo = Transform.rotate(
        angle: -pi / 4.0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0), color: Colors.white),
          width: 400.0,
          height: 400.0,
        ));

    return Stack(
      children: <Widget>[
        //fondo_morado,
        Positioned(top: -150.0, child: forma_fondo),
        /*Positioned(top: 30.0, left: -70.0, child: circulo),
        Positioned(bottom: -30.0, right: 10.0, child: circulo),
        Positioned(top: -60.0, right: -50.0, child: circulo),
        Positioned(bottom: -30.0, left: 30.0, child: circulo),*/
        Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage('assets/img/logo.png'),
                width: 150,
              ),
              /* Icon(Icons.person_pin_circle, color: Colors.black, size: 100.00), */
              SizedBox(
                height: 10.0,
                width: double.infinity,
              ),
              Text(
                'Galaspace',
                style: TextStyle(
                    color: Color.fromRGBO(62, 38, 105, 1),
                    fontSize: 40.0,
                    fontFamily: 'ArialRoundedMTBold'),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _loginForm(BuildContext context) {
    //final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
            height: 30.0,
          )),
          //_crearEmail(),
          Container(
            width: 370.0,
            child: Column(
              children: <Widget>[
                _crearEmail(),
                SizedBox(
                  height: 30.0,
                ),
                _crearPassword(),
                SizedBox(
                  height: 50.0,
                ),
                _crearBoton(),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          FlatButton(
            height: 60.0,
            minWidth: 370.0,
            textColor: Colors.white,
            color: Color.fromRGBO(231, 31, 118, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            onPressed: () {
              //Navigator.pushReplacementNamed(context, 'Registro');
              Navigator.pushNamed(context, 'Registro');
            },
            child: Text(
              'REGISTRARSE',
              style: TextStyle(
                  fontSize: 25.0 /*, color: Color.fromRGBO(92, 78, 154, 1)*/),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _crearEmail() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20.0),
      //height: 600.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 30.0),
        child: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return TextField(
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  //contentPadding: EdgeInsets.only(left: 20.0),
                  icon: Icon(
                    Icons.email,
                    color: Colors.deepPurpleAccent,
                  ),
                  hintText: 'ejemplo@correo.com',
                  labelText: 'Email',
                  errorText:
                      (!EmailValidator.validate(_email) && _email.length > 5)
                          ? 'Email no es Correcto'
                          : null,
                ),
                onChanged: (valor) {
                  setState(() {
                    _email = valor;
                  });
                },
              );
            }),
      ),
    );
  }

  Widget _crearPassword() {
    return Container(
      //padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 30.0),
        child: TextField(
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(
              Icons.lock,
              color: Colors.deepPurpleAccent,
            ),
            //Vignesh123!
            labelText: 'Password',
            errorText:
                (/*!validateStructure(_password) && */ _password.length == 4)
                    ? 'Contrase??a Incorrecta debe tener 6 caracteres al menos'
                    : null,
          ),
          onChanged: (valor) {
            setState(() {
              _password = valor;
            });
          },
        ),
      ),
    );
  }

  Widget _crearBoton() {
    //fromValidStream
    return ElevatedButton(
      child: Container(
        width: 370.0,
        height: 60.0,
        //padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
        child: Center(
            child: Text(
          'INGRESAR',
          style: TextStyle(
              fontFamily: 'ArialRoundedMTBold',
              fontSize: 25.0 /*, color: Color.fromRGBO(92, 78, 154, 1)*/),
        )),
      ),
      style: ButtonStyle(
        foregroundColor: getColor(Color.fromRGBO(92, 78, 154, 1), Colors.white),
        backgroundColor: getColor(
            Color.fromRGBO(255, 255, 255, 1), Color.fromRGBO(92, 78, 154, 1)),
        side: getBorde(Color.fromRGBO(92, 78, 154, 1), Colors.black),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: Colors.red)),
        ),
      ),
      onPressed:
          (EmailValidator.validate(_email) /*&& validateStructure(_password)*/
              ? () {
                  print(' $_email  $_password');
                  Navigator.pushReplacementNamed(context, 'Home');
                }
              : () {
                  print('Error');
                  //Navigator.pushReplacementNamed(context, 'Perfil');
                  mostrarAlerta(context, 'Correo o Contrase??a son incorrectos');
                }),
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
