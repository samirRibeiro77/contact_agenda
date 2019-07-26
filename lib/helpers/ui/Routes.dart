import 'package:contact_agenda/domain/Contact.dart';
import 'package:contact_agenda/helpers/data/SqlControl.dart';
import 'package:contact_agenda/ui/ContactPage.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes();

  Future<Contact> showContactPage(BuildContext context, {Contact contact}) async {
    var database = SqlControl();
    
    final recContact = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => ContactPage(contact: contact))
    );

    if (recContact != null) {
      if (contact != null) {
        await database.saveContact(contact);
      } else {
        await database.saveContact(recContact);
      }
    }

    return contact ?? recContact;
  }
}