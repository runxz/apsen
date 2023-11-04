import 'package:apsen/db.dart';
import 'package:flutter/material.dart';
import 'MmP.dart';
import 'Mp.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> _loginUser() async {
    final conn = await getConnection();
    final email = _emailController.text;
    final pwd = _passwordController.text;

    final results = await conn.query(
      'SELECT * FROM users WHERE email = ? AND password = ?',
      [email, pwd],
    );
    if (results.isNotEmpty) {
      final userId = results.first['id'].toString();
      final name = results.first['name'].toString();
      final is_manager = results.first['is_manager'];
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('email', email);
      await prefs.setInt('is_manager', is_manager);
      await prefs.setString('userID', userId);
      await prefs.setString('name', name);
      await conn.close();

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => is_manager == 1 ? ManagerPage() : MemberPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _loginUser,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
