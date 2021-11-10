import 'package:flutter/material.dart';

class PerfilUsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, //fromRGBO(92, 78, 154, 1),
        /*actions: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: 'Atras',
              onPressed: () {
                print('Hola mundo');
              }),
          IconButton(
              icon: Icon(Icons.more_vert_rounded),
              tooltip: 'Configuracion',
              onPressed: () {
                print('Hola mundo');
              }),
        ],*/
        centerTitle: false,
        //backgroundColor: Colors.brown[900],
        title: Stack(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Color.fromRGBO(92, 78, 154, 1),
                    tooltip: 'Atras',
                    onPressed: () {
                      print('Hola mundo');
                    }),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                  'Perfil',
                  style: TextStyle(
                      color: Color.fromRGBO(92, 78, 154, 1), fontSize: 18.0),
                ),
                Expanded(child: Container()),
                IconButton(
                    icon: Icon(Icons.more_vert_rounded),
                    color: Color.fromRGBO(92, 78, 154, 1),
                    tooltip: 'Configuracion',
                    onPressed: () {
                      print('Hola mundo');
                    }),
              ],
            )
          ],
        ),
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

/*
  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula.uniqueId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage(pelicula.getPosterImg()),
                height: 150.0,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                pelicula.title,
                style: Theme.of(context).textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                pelicula.originalTitle,
                style: Theme.of(context).textTheme.bodyText2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.star_border),
                  Text(
                    pelicula.voteAverage.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting(Pelicula pelicula) {
    final peliProvider = new PeliculasProvider();

    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _crearActorPageView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearActorPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: actores.length,
        itemBuilder: (context, i) => _actorTarjeta(actores[i]),
      ),
    );
  }

  Widget _actorTarjeta(Actor actor) {
    return Container(
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              image: NetworkImage(actor.getFoto()),
              placeholder: AssetImage('assets/img/no-image.jpg'),
              height: 170.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
  */
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
              child: Container(
                padding: EdgeInsets.only(
                  top: 110,
                  left: 150,
                ),
                child: CircleAvatar(
                  minRadius: 35,
                  maxRadius: 35,
                  //radius: 20,
                  backgroundColor: Color.fromRGBO(62, 38, 105, 1),
                  child: Icon(
                    Icons.person_add,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
              onTap: () async {
                print('hola mundo');
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
}
