import 'package:contact_agenda/domain/Contact.dart';
import 'package:contact_agenda/helpers/Data/SqlControl.dart';
import 'package:flutter/material.dart';

import 'package:contact_agenda/ui/cards/contact_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var database = SqlControl();
  var contactCard = ContactCard();
  List<Contact> contacts = List();

  @override
  void initState() {
    super.initState();

    database.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return contactCard.getCard(context, contacts[index]);
        },
      ),
    );
  }
}
