import 'dart:io';

import 'package:contact_agenda/domain/Contact.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  Contact contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameFocus = FocusNode();

  var _userEdited = false;
  Contact _editedContact;

  @override
  void initState() {
    super.initState();
    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact.toMap());

      _nameController.text = _editedContact.name;
      _emailController.text = _editedContact.email;
      _phoneController.text = _editedContact.phone;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(_editedContact.name ?? "Novo contato"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if(_editedContact.name != null && _editedContact.name.isNotEmpty) {
              Navigator.pop(context, _editedContact);
            }
            else {
              FocusScope.of(context).requestFocus(_nameFocus);
            }
          },
          child: Icon(Icons.save),
          backgroundColor: Colors.red,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: _editedContact.img != null
                              ? FileImage(File(_editedContact.img))
                              : AssetImage("lib/images/contact_default_image.png"))),
                ),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nome"),
                controller: _nameController,
                focusNode: _nameFocus,
                onChanged: (text) {
                  _userEdited = true;
                  setState(() {
                    _editedContact.name = text;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Email"),
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.email = text;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Phone"),
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                onChanged: (text) {
                  _userEdited = true;
                  _editedContact.phone = text;
                },
              )
            ],
          ),
        ),
    );
  }
}
