import 'package:contact_agenda/domain/Contact.dart';

import 'ContactSql.dart';

class SqlControl {
  ContactSql _contact;

  SqlControl() {
    _contact = ContactSql();
  }

  Future<Contact> saveContact(Contact contact) async {
    return await _contact.saveOrUpdateContact(contact);
  }
  Future<Contact> getContact(int id) async {
    return await _contact.getContact(id);
  }
  void deleteContact(int id) async {
    await _contact.deleteContact(id);
  }
  Future<List> getAllContacts() async {
    return await _contact.getAllContacts();
  }
}