import 'package:contact_agenda/helpers/data/SqlControl.dart';
import 'package:contact_agenda/helpers/ui/Routes.dart';
import 'package:flutter/material.dart';
import 'package:contact_agenda/domain/Contact.dart';
import 'package:contact_agenda/ui/cards/contact_card.dart';

enum OrderOptions { orderAZ, orderZA }

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

  void _orderList(OrderOptions result) {
    switch(result) {
      case OrderOptions.orderAZ:
        contacts.sort((a, b) {
          return a.name.toLowerCase().compareTo(b.name.toLowerCase());
        });
        break;
      case OrderOptions.orderZA:
        contacts.sort((a, b) {
          return b.name.toLowerCase().compareTo(a.name.toLowerCase());
        });
        break;
    }

    setState(() {});
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
        actions: <Widget>[
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) =>
            <PopupMenuEntry<OrderOptions>>[
              const PopupMenuItem<OrderOptions>(
                  child: Text("Ordernar de A-Z"), value: OrderOptions.orderAZ),
              const PopupMenuItem<OrderOptions>(
                  child: Text("Ordernar de Z-A"), value: OrderOptions.orderZA)
            ],
            onSelected: _orderList,
          )
        ],
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          routes.showContactPage(context).whenComplete(() {
            _loadPage();
          });
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
