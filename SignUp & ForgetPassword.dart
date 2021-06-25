import 'package:egyption_tourism_guide/UI/Const%20UI.dart';

import '../UI/Login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();

  SignUp();
}

class _signUpState extends State<SignUp> {
  TextEditingController _firstNameController = new TextEditingController();
  TextEditingController _lastNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _newPasswordController = new TextEditingController();
  _signUpState();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Sign Up",
          style: new TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: HexColor(appbarColor),
      ),
      backgroundColor: HexColor(backgroundColor),
      body: new Container(
        padding: const EdgeInsets.all(30.0),
        //  margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formkey,
          child: new Column(
            children: [
              new TextFormField(
                controller: _firstNameController,
                decoration: new InputDecoration(
                  hintText: 'First Name',
                  icon: new Icon(Icons.perm_identity),
                ),
              ),
              new TextFormField(
                controller: _lastNameController,
                decoration: new InputDecoration(
                  hintText: 'Last Name',
                  icon: new Icon(Icons.perm_identity),
                ),
              ),
              new TextFormField(
                controller: _emailController,
                validator: (_emailController) =>
                !_emailController.contains('@')
                    ? 'Invalid E-mail Address'
                    : null,
                decoration: new InputDecoration(
                  hintText: 'Email Address',
                  icon: new Icon(Icons.email_outlined),
                ),
              ),

              new TextFormField(
                controller: _newPasswordController,
                validator: (_newPasswordController) =>
                _newPasswordController.length < 8
                    ? 'Password is too short , use 8 characters at least'
                    : null,
                decoration: new InputDecoration(
                  hintText: 'New Password',
                  icon: new Icon(Icons.lock),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: new RaisedButton(
                  child: new Text(
                    "Sign Up",
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    final form = _formkey.currentState;
                    if (!form.validate())
                      form.save();
                    else
                      _signUp(context);},
                  color: HexColor(buttonColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  String _error1="This email is already registered";
  final _auth = FirebaseAuth.instance;
  void _signUp(BuildContext context) async {
    try {
      Firebase.initializeApp();
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _newPasswordController.text);
      if(newUser!=null){
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>Login()),
        );
      }
    }
    catch (_error1){
      print(_error1);
    }
  }
}

class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = new TextEditingController();
  String resetCode = " ";
  void resetPassword() {
    setState(() {
        resetCode = "Reset password link was sent to ${_emailController.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Reset Password",
          style: new TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: HexColor(appbarColor),
      ),
      backgroundColor: HexColor(backgroundColor),
      body: new Container(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formkey,
          child: new Column(
            children: [
              new TextFormField(
                controller: _emailController,
                validator: (_emailController) =>
                !_emailController.contains('@')
                    ? 'Invalid E-mail Address'
                    : null,
                decoration: new InputDecoration(
                  hintText: 'Enter your email ',
                  icon: new Icon(Icons.email_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top :8.0),
                child: new RaisedButton(
                  child: new Text(
                    "Reset Password",
                    style: new TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    final form = _formkey.currentState;
                    if (!form.validate())
                      form.save();
                    else
                      resetPassword();
                  },
                  color: HexColor(buttonColor),
                ),
              ),
              new Text("$resetCode"),
            ],
          ),
        ),
      ),
    );
  }
}
