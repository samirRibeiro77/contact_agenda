import 'package:contact_agenda/Helpers/classes/ContactHelper.dart';

class Contact {
  int id;
  String name, email, phone, img;

  Contact();

  Contact.fromMap(Map map) {
    id = map[ContactHelper.idColumn];
    name = map[ContactHelper.nameColumn];
    email = map[ContactHelper.emailColumn];
    phone = map[ContactHelper.phoneColumn];
    img = map[ContactHelper.imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      ContactHelper.nameColumn: name,
      ContactHelper.emailColumn: email,
      ContactHelper.phoneColumn: phone,
      ContactHelper.imgColumn: img
    };

    if (id != null) {
      map[ContactHelper.idColumn] = id;
    }

    return map;
  }

  @override
  String toString() {
    return "Contact (id: $id, name: $name, email: $email, phone: $phone, img: $img)";
  }
}
