import 'package:contact_agenda/Domain/Contact.dart';

import 'ContactSql.dart';

class SqlControl {
  ContactSql _contact;

  SqlControl() {
    _contact = ContactSql();
  }

  Future<Contact> saveContact(Contact contact) async {
    return await _contact.saveContact(contact);
  }
  Future<Contact> getContact(int id) async {
    return await _contact.getContact(id);
  }
  void deleteContact(int id) async {
    await _contact.deleteContact(id);
  }
  void updateContact(Contact contact) async {
    await _contact.updateContact(contact);
  }
  Future<List> getAllContacts() async {
    return await _contact.getAllContacts();
  }
}