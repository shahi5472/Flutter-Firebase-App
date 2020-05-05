import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/shareWidget/textFieldDecoration.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _fromState = GlobalKey<FormState>();
  bool loading = false;

  String fullName = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _fromState,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) => value.isEmpty ? "Enter your full name" : null,
            keyboardType: TextInputType.emailAddress,
            decoration: textField.copyWith(
                fillColor: Colors.brown[100],
                hintText: 'Full Name',
                labelText: 'Full Name'),
            onChanged: (value) {
              setState(() {
                fullName = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) => value.isEmpty ? "Enter your an email" : null,
            keyboardType: TextInputType.emailAddress,
            decoration: textField.copyWith(
                fillColor: Colors.brown[100],
                hintText: 'Email',
                labelText: 'Email'),
            onChanged: (value) {
              setState(() {
                email = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            validator: (value) => value.isEmpty ? "Enter your password" : null,
            keyboardType: TextInputType.visiblePassword,
            decoration: textField.copyWith(
                fillColor: Colors.brown[100],
                hintText: 'Password',
                labelText: 'Password'),
            obscureText: true,
            onChanged: (value) {
              setState(() {
                password = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
