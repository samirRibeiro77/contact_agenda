import 'dart:io';
import 'package:contact_agenda/helpers/data/SqlControl.dart';
import 'package:contact_agenda/domain/Contact.dart';
import 'package:contact_agenda/helpers/ui/Routes.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactCard {
  ContactCard();

  void _showOptions(BuildContext context, Contact contact) {
    var routes = Routes();
    var database = SqlControl();

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheet(
            onClosing: () {},
            builder: (context) {
              return Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            launch("tel:${contact.phone}");
                          },
                          child: Text(
                            "Ligar",
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            routes.showContactPage(context, contact: contact);
                          },
                          child: Text(
                            "Editar",
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            database.deleteContact(contact.id);
                          },
                          child: Text(
                            "Excluir",
                            style: TextStyle(color: Colors.red, fontSize: 20.0),
                          )),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget getCard(BuildContext context, Contact contact) {
    return GestureDetector(
        onTap: () {
          _showOptions(context, contact);
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
                        fit: BoxFit.cover,
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
