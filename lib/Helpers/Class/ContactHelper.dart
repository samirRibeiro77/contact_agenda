import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ContactHelper {
  static get contactTable => "contactTable";

  static get idColumn => "idColumn";

  static get nameColumn => "nameColumn";

  static get emailColumn => "emailColumn";

  static get phoneColumn => "phoneColumn";

  static get imgColumn => "imgColumn";

  static final ContactHelper _instace = ContactHelper.internal();

  ContactHelper.internal();

  factory ContactHelper() => _instace;

  Database _db;

  Future<Database> get db async => _db ?? (_db = await initDb());

  Future<Database> initDb() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, "contacts.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
          await db.execute(
              "CREATE TABLE $contactTable ($idColumn INTEGER PRYMARI KEY, $nameColumn TEXT, $emailColumn TEXT, $phoneColumn TEXT, $imgColumn TEXT)");
        });
  }
}
