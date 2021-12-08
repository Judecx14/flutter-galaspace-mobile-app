import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'OPerfil');
      },
      child: Container(
        margin: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: _itemDecoration(),
        child: const ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/img/friend.jpg'),
          ),
          title: Text(
            'Hailee Steinfeld',
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Arial',
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _itemDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0.0, 0.0),
          blurRadius: 5.0,
        )
      ],
    );
  }
}
