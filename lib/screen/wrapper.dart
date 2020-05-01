import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/modal/user.dart';
import 'package:flutterfirebaseapp/screen/authentiate/authenticate.dart';
import 'package:flutterfirebaseapp/screen/home/homePage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user != null
        ? HomePage(
            uid: user.uid,
          )
        : Authenticate();
  }
}
