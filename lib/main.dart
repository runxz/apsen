import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'register.dart';
import 'Mp.dart';
import 'MmP.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apsen',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login_Register(),
      },
    );
  }
}

class Login_Register extends StatefulWidget {
  const Login_Register({Key? key}) : super(key: key);

  @override
  State<Login_Register> createState() => _Login_RegisterState();
}

class _Login_RegisterState extends State<Login_Register> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final prefs = await SharedPreferences.getInstance();
      final userId = prefs.getString('userID');
      final is_manager = prefs.getInt('is_manager');
      final name = prefs.getString('name');
      if (userId != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                is_manager == 1 ? ManagerPage() : MemberPage(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          LoginPage(),
          RegisterPage(),
        ],
      ),
    );
  }
}

Future<void> logout(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('userID');
  await prefs.remove('is_manager');
  await prefs.remove('email');
  await prefs.remove('name');
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (BuildContext context) => Login_Register()),
    (Route route) => false,
  );
}
