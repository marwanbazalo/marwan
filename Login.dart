//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SignUp & ForgetPassword.dart';
import 'HomePage.dart';
import 'package:hexcolor/hexcolor.dart';
import '../UI/Const UI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

TextEditingController _emailController = new TextEditingController();
TextEditingController _passwordController = new TextEditingController();

class Login extends StatefulWidget {
  final String id = 'login page';

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  String _user = ' ';
  bool _passwordVisibility = true;
  final _formkey = GlobalKey<FormState>();
  void _submit() {
    setState(() {
      if (_emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty)
        _user = _emailController.text;
      else
        _user = ' ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: HexColor(backgroundColor),
      // appBar: new AppBar(
      //   backgroundColor: HexColor(appbarColor),
      //   title: new Text(
      //     "Login",
      //     style: new TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true,
      // ),
      body: ListView(children: [
        new Container(
          width: MediaQuery.of(context).size.width,
          //  height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.only(top: 30),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: HexColor(appbarColor),
                    border: Border.all(
                      color: Colors.black,
                      width: 3,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / 6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: new Text(
                              'EGYPTIAN TOUR GUIDE',
                              style: new TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 15,color: Colors.white),
                            ),
                          ),
                          new Text(
                            'All You Need to Know about monuments',
                            style: new TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 8,color: Colors.white,fontStyle: FontStyle.italic),
                          ),

                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: new Image.asset(
                          'images/logo2.png',
                          // width: 150,
                          // height: 150,
                          fit: BoxFit.fitHeight,

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Container(
                  // height: 180,
                  margin: const EdgeInsets.only(top: 15),
                  padding: new EdgeInsets.all(5),
                  width: MediaQuery.of(context).size.width - 5,
                  child: Form(
                    key: _formkey,
                    child: new Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                              child: new Text('Login',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: new TextFormField(
                            controller: _emailController,
                            decoration: new InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'E-mail',
                              labelText: 'E-mail',
                              icon: new Icon(Icons.perm_identity),
                            ),
                            validator: (_emailController) =>
                                !_emailController.contains('@')
                                    ? 'Invalid E-mail Address'
                                    : null,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: new TextFormField(
                            controller: _passwordController,
                            decoration: new InputDecoration(
                              hintText: 'Password',
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                icon: _passwordVisibility
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisibility = !_passwordVisibility;
                                  });
                                },
                              ),
                              icon: new Icon(Icons.vpn_key),
                            ),
                            obscureText: _passwordVisibility,
                          ),
                        ),
                        new Padding(padding: new EdgeInsets.all(15.0)),
                        new Center(
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                padding: new EdgeInsets.all(5.0),
                                child: new SizedBox(
                                    height: 35,
                                    width: 250,
                                    child: new RaisedButton(
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(30.0)),
                                      onPressed: () {
                                        final form = _formkey.currentState;
                                        if (!form.validate())
                                          form.save();
                                        else
                                          _login(context);
                                      },
                                      child: new Text('Login',
                                          style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500)),
                                      color: HexColor(buttonColor),
                                    )),
                              ),
                              new Container(
                                alignment: Alignment.center,
                                child: new Text(
                                  "| or |",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.cyan,
                                      fontSize: 17),
                                ),
                              ),
                              new Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: new SizedBox(
                                      height: 35,
                                      width: 250,
                                      child: new RaisedButton(
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0)),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => SignUp()),
                                          );
                                        },
                                        child: new Text(
                                          'Sign up',
                                          style: new TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        color: HexColor(buttonColor),
                                      ),
                                    ),
                                  )),
                              new Container(
                                alignment: Alignment.center,
                                child: new TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                forgotPassword()));
                                  },
                                  child: new Text(
                                    'Forgot password ?',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ]),
    );
  }
}

String _error1 = "Invalid e-mail or password";
final _auth = FirebaseAuth.instance;
void _login(BuildContext context) async {
  User firebaseUser;
  await _auth
      .signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      )
      .then(
        (authUser) => {
          firebaseUser = authUser.user,
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => homePage()))
          // ignore: invalid_return_type_for_catch_error
        },
      )
      .catchError((onError) => showDialog(
          builder: (context) => AlertDialog(
                title: Text(_error1),
              ),
          context: context));
}
