import 'dart:io';
import 'package:contact_agenda/domain/Contact.dart';
import 'package:contact_agenda/helpers/ui/Routes.dart';
import 'package:flutter/material.dart';

class ContactCard {
  ContactCard();

  Widget getCard(BuildContext context, Contact contact) {
    var routes = Routes();
    return GestureDetector(
        onTap: () {
          routes.showContactPage(context, contact: contact);
        },
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
                        image: contact.img != null && contact.img.isNotEmpty
                            ? FileImage(File(contact.img))
                            : AssetImage(
                                "lib/images/contact_default_image.png"))),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(contact.name ?? "",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold)),
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
