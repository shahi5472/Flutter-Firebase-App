import 'package:flutter/material.dart';
import 'package:flutterfirebaseapp/services/auth.dart';
import 'package:flutterfirebaseapp/shareWidget/loading.dart';
import 'package:flutterfirebaseapp/shareWidget/textFieldDecoration.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _fromState = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0,
              title: Text('Log In'),
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
                              value.isEmpty ? "Enter your email" : null,
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
                            'Log in',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_fromState.currentState.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _authService
                                  .signInWithEmailPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                });
                                print('Error');
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
                            'Create a new account',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            widget.toggleView();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          child: Text('Sign in Anonymous'),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _authService.signInAnon();
                            if (result == null) {
                              setState(() {
                                loading = false;
                              });
                              print('Error');
                            }
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
