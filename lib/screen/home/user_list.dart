import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/modal/user.dart';
import 'package:flutterfirebaseapp/screen/home/user_tile.dart';
import 'package:provider/provider.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<User>>(context) ?? [];
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return UserTile(user: users[index]);
      },
    );
  }
}
