import 'package:firebase_login/Pages/sign_up.dart';
import 'package:firebase_login/Setup/signIn.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget{
  @override
  _WelcomePageState createState() => _WelcomePageState();
  }

class _WelcomePageState extends State<WelcomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My firebase app"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(onPressed: navigateToSignIn,
          child: Text('Sign in') ,),
          RaisedButton(onPressed: navigateToSignUp,
            child: Text('Sign up') ,)
        ],
      ),
    );
  }

  // TODO create signin & signin methods
  void navigateToSignIn(){
    // TODO: Navigate to the home page
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage(),fullscreenDialog: true));

  }

  void navigateToSignUp(){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUp(),fullscreenDialog: true));
  }
}

