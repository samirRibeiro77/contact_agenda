import 'package:contact_agenda/Domain/Contact.dart';
import 'package:contact_agenda/Helpers/Class/ContactHelper.dart';

class ContactSql {
  Future<Contact> saveContact(Contact contact) async {
    var database = await ContactHelper().db;
    contact.id =
        await database.insert(ContactHelper.contactTable, contact.toMap());
    return contact;
  }

  Future<Contact> getContact(int id) async {
    var database = await ContactHelper().db;
    List<Map> maps = await database.query(ContactHelper.contactTable,
        columns: [
          ContactHelper.idColumn,
          ContactHelper.nameColumn,
          ContactHelper.emailColumn,
          ContactHelper.phoneColumn,
          ContactHelper.imgColumn
        ],
        where: "${ContactHelper.idColumn} = ?",
        whereArgs: [id]);

    if (maps.length > 0) {
      return Contact.fromMap(maps.first);
    }

    return null;
  }

  Future<int> deleteContact(int id) async {
    var database = await ContactHelper().db;

    return await database.delete(ContactHelper.contactTable,
        where: "${ContactHelper.idColumn} = ?", whereArgs: [id]);
  }

  Future<int> updateContact(Contact contact) async {
    var database = await ContactHelper().db;
    return await database.update(ContactHelper.contactTable, contact.toMap(),
        where: "${ContactHelper.idColumn} = ?", whereArgs: [contact.id]);
  }

  Future<List> getAllContacts() async {
    var database = await ContactHelper().db;
    List listMap =
        await database.rawQuery("SELECT * FROM ${ContactHelper.contactTable}");
    var listContact = List<Contact>();
    listMap.forEach((map) {
      listContact.add(Contact.fromMap(map));
    });
    return listContact;
  }
}
