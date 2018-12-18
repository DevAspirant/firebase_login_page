import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/Setup/signIn.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
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
                onPressed: signUp,
                child: Text('Sign up'),
              )
            ],
          )
      ),
    );
  }

  // TODO : methods
  Future<void> signUp() async {
    // TODO: validate fileds
    final formState = _formKey.currentState;
    print("pressed");
    if (formState.validate()) {
      formState.save();
      try {
        // TODO: Navigate to home
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        // Display to the user that we sent an email
        // TODO: Navigate to the home page
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));
      } catch (e) {
        print(e.message);
      }
    }
    // TODO: login to firebase
  }
  }