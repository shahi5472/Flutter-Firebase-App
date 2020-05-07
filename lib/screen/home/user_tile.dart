import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/modal/user.dart';

class UserTile extends StatelessWidget {
  final User user;

  UserTile({this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: Card(
        margin: EdgeInsets.fromLTRB(6, 6, 6, 0),
        child: ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[user.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
          ),
          title: Text(user.name),
          subtitle: Text('Take ${user.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
