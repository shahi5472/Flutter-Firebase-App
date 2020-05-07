import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfirebaseapp/modal/user.dart';
import 'package:flutterfirebaseapp/screen/home/settings_form.dart';
import 'package:flutterfirebaseapp/screen/home/user_list.dart';
import 'package:flutterfirebaseapp/services/auth.dart';
import 'package:flutterfirebaseapp/services/database.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  final String uid;

  HomePage({this.uid});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettings() {
      showModalBottomSheet(
          context: context,
          builder: (contex) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<User>>.value(
      value: DatabaseServices().users,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Home'),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _authService.signOut();
              },
              icon: Icon(Icons.exit_to_app),
              label: Text('Log out'),
            ),
            FlatButton.icon(
              onPressed: () => _showSettings(),
              icon: Icon(Icons.settings),
              label: Text(''),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/coffee_bg.png'),
            ),
          ),
          child: UserList(),
        ),
      ),
    );
  }
}
