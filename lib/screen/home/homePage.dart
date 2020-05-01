import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/services/auth.dart';

class HomePage extends StatelessWidget {
  final String uid;

  HomePage({this.uid});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Log out')),
        ],
      ),
      body: Center(child: Text(this.uid)),
    );
  }
}
