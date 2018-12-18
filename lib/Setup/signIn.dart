import 'package:firebase_login/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Sign in"),
      ),
      body: Form(
        key: _formKey,
        // TODO: implement key
        child: Column(
          children: <Widget>[
            // TODO: implements fields
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'please type an email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'please provide a password @ least 6 characters';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: signIn,
              child: Text('Sign in'),
            )
          ],
        )
      ),
    );
  }

  // TODO : methods
  Future<void> signIn() async {
    // TODO: validate fileds
    final formState = _formKey.currentState;
    print("pressed");
    if (formState.validate()) {
      formState.save();
      try {
        // TODO: Navigate to home
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        // TODO: Navigate to the home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
    // TODO: login to firebase
  }
}
