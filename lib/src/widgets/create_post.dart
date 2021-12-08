import 'package:flutter/material.dart';

class CreatePost extends StatelessWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7.5, vertical: 2.5),
      padding: const EdgeInsets.all(15.0),
      width: double.infinity,
      height: 150.0,
      decoration: _postBoxDecoration(),
      child: const _CreatePostForm(),
    );
  }

  BoxDecoration _postBoxDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0.0, 0.0),
            blurRadius: 20.0,
          )
        ],
      );
}

class _CreatePostForm extends StatelessWidget {
  const _CreatePostForm({Key? key}) : super(key: key);

  final Color purple = const Color.fromRGBO(92, 78, 154, 1);
  final Color pink = const Color.fromRGBO(231, 31, 118, 1);
  final Color blue = const Color.fromRGBO(62, 38, 105, 1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          cursorColor: purple,
          decoration: _createPostInputDecoration(),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: _SelectImageButton(pink: pink),
                ),
              ),
              _PostButton(pink: pink),
            ],
          ),
        )
      ],
    );
  }

  InputDecoration _createPostInputDecoration() {
    return InputDecoration(
      icon: const CircleAvatar(
        backgroundImage: AssetImage('assets/img/me.jpeg'),
        radius: 25.0,
      ),
      hintText: 'Escribe lo que estas pensando...',
      hintStyle: const TextStyle(fontSize: 15.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(100.0),
      ),
    );
  }
}

class _PostButton extends StatelessWidget {
  const _PostButton({Key? key, required this.pink}) : super(key: key);

  final Color pink;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10.0),
      width: 150.0,
      height: 50.0,
      child: OutlinedButton(
        child: Text(
          'Publicar',
          style: TextStyle(
            color: pink,
            fontFamily: 'ArialRoundedMTBold',
            fontSize: 17.0,
          ),
        ),
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: pink),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
          ),
          primary: pink,
        ),
      ),
    );
  }
}

class _SelectImageButton extends StatelessWidget {
  const _SelectImageButton({Key? key, required this.pink}) : super(key: key);

  final Color pink;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(
          color: pink,
          width: 1.5,
        ),
      ),
      child: IconButton(
        highlightColor: pink.withOpacity(0.2),
        iconSize: 25.0,
        icon: Icon(
          Icons.image,
          color: pink,
        ),
        onPressed: () {},
      ),
    );
  }
}
