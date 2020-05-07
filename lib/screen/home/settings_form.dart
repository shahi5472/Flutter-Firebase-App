import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/modal/user.dart';
import 'package:flutterfirebaseapp/services/database.dart';
import 'package:flutterfirebaseapp/shareWidget/loading.dart';
import 'package:flutterfirebaseapp/shareWidget/textFieldDecoration.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _fromState = GlobalKey<FormState>();
  bool loading = false;

  List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String fullName = null;
  String sugarValue = null;
  int strength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<User>(
        stream: DatabaseServices(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final user = snapshot.data;
            return Form(
              key: _fromState,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Update user information',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      initialValue: user.name,
                      validator: (value) =>
                          value.isEmpty ? "Enter your full name" : null,
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
                    DropdownButtonFormField(
                      decoration: textField.copyWith(
                        fillColor: Colors.brown[100],
                      ),
                      value: sugarValue ?? user.sugars,
                      items: sugars.map((value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text('$value sugar'),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          sugarValue = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Slider(
                      activeColor: Colors.brown[strength ?? user.strength],
                      inactiveColor: Colors.brown[strength ?? user.strength],
                      value: (strength ?? user.strength).toDouble(),
                      min: 100,
                      max: 900,
                      divisions: 8,
                      onChanged: (value) {
                        setState(() {
                          strength = value.round();
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      color: Colors.lightBlue,
                      child: Text('Update'),
                      onPressed: () async {
                        if (_fromState.currentState.validate()) {
                          await DatabaseServices(uid: user.uid).updateUserData(
                              sugarValue ?? user.sugars,
                              fullName ?? user.name,
                              strength ?? user.strength);
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return Loading();
        });
  }
}
