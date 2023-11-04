import 'main.dart';
import 'package:flutter/material.dart';

class MemberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member Page'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Text('Welcome, Member!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logout(context),
        child: Icon(Icons.logout),
      ),
    );
  }
}
