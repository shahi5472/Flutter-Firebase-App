import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/services/auth.dart';
import 'package:flutterfirebaseapp/shareWidget/loading.dart';
import 'package:flutterfirebaseapp/shareWidget/textFieldDecoration.dart';

class Register extends StatefulWidget {
  final Function toggleView;

  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _authService = AuthService();
  final _fromState = GlobalKey<FormState>();
  bool loading = false;

  String fullName = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: Text('Register'),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  child: Form(
                    key: _fromState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
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
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? "Enter your an email" : null,
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
                          validator: (value) =>
                              value.isEmpty ? "Enter your password" : null,
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
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          color: Colors.brown,
                          child: Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_fromState.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _authService
                                  .registerWithEmailPassword(email, password);
                              print(email);
                              print(password);
                              print(result.toString());
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Please check information is correct.';
                                });
                              }
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          color: Colors.brown,
                          child: Text(
                            'All ready have an account? Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            widget.toggleView();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
