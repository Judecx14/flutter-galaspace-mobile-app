import 'package:flutter/material.dart';
import 'package:galaspace/src/widgets/contact_item.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
        ContactItem(),
      ],
    );
  }
}
