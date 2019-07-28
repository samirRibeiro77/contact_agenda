import 'package:contact_agenda/helpers/data/SqlControl.dart';
import 'package:contact_agenda/helpers/ui/Routes.dart';
import 'package:flutter/material.dart';
import 'package:contact_agenda/domain/Contact.dart';
import 'package:contact_agenda/ui/cards/contact_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var database = SqlControl();
  var routes = Routes();
  var contactCard = ContactCard();
  List<Contact> contacts = List();

  void _loadPage() {
    database.getAllContacts().then((list) {
      setState(() {
        contacts = list;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPage();
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
        onPressed: () {
          routes.showContactPage(context).whenComplete(() {_loadPage();});
        },
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
