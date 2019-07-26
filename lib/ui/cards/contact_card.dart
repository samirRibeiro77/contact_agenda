import 'dart:io';
import 'package:contact_agenda/Domain/Contact.dart';
import 'package:flutter/material.dart';

class ContactCard {
  ContactCard();

  Widget getCard(BuildContext context, Contact contact) {
    return GestureDetector(
        child: Card(
            child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: contact.img != null
                        ? FileImage(File(contact.img))
                        : AssetImage("lib/Images/contact_default_image.png"))),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(contact.name ?? "",
                    style:
                        TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold)),
                Text(contact.email ?? "", style: TextStyle(fontSize: 18.0)),
                Text(contact.phone ?? "", style: TextStyle(fontSize: 18.0))
              ],
            ),
          )
        ],
      ),
    )));
  }
}
