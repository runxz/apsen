import 'package:mysql1/mysql1.dart';

Future<MySqlConnection> getConnection() async {
  final settings = ConnectionSettings(
    host: 'sql12.freemysqlhosting.net',
    port: 3306, //YOUR MYSQL PORT
    user: 'sql12658738',
    password: 'LXykYU42Qw',
    db: 'sql12658738',
  );

  print('Connecting to database...');
  final conn = await MySqlConnection.connect(settings);
  print('Connected to database.');

  return conn;
}
