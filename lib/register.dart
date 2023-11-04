import 'package:flutter/material.dart';
import 'db.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isManager = false;

  Future<void> _registerUser() async {
    final conn = await getConnection();
    final name = _nameController.text;
    final email = _emailController.text;
    final pwd = _passwordController.text;
    await conn.query(
      'INSERT INTO users (name, email, password, is_manager) VALUES (?,?,?,?)',
      [name, email, pwd, _isManager],
    );
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Registration Successful'),
        content: Text('You have successfully registered.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
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
            ListTile(
              title: const Text('Is Manager'),
              trailing: Switch(
                value: _isManager,
                onChanged: (value) {
                  setState(() {
                    _isManager = value;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _registerUser,
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
