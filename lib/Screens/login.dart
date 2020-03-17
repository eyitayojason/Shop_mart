import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shop_mart/Screens/firebase_auth.dart';
import 'package:shop_mart/screens/HomePage.dart';
import 'package:shop_mart/screens/signup.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  bool _isLoading = false;
  String _email, _password;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextStyle defaultStyle = TextStyle(
      fontSize: 80, color: Colors.black87, fontWeight: FontWeight.w600);
  TextStyle formStyle = TextStyle(
    color: Colors.blueGrey,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: <Widget>[
      Form(
        key: formkey,
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/11439.png"),
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.3), BlendMode.dstATop),
                  fit: BoxFit.cover), // has the effect of softening the shadow
            ),
            height: mQ.height,
            width: mQ.width,
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                ClipRect(
                    child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    alignment: Alignment.center,
                    color: Colors.black.withOpacity(0.0),
                  ),
                )),
                Container(
                  padding: const EdgeInsets.fromLTRB(0.0, 20, 0.0, 0.0),
                  child: RichText(
                    text: TextSpan(
                      text: "Hello\nThere!",
                      style: defaultStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: mQ.height * 0.1,
                  width: mQ.width * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: (Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: TextFormField(
                          controller: _emailController,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please enter an email";
                            }
                            // else if (input.allMatches(_email) == 1){
                            // return "Invalid Email";
                          }
                          //},
                          ,
                          onSaved: (input) => _email = input,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            focusColor: Colors.green,
                            fillColor: Colors.white70,
                            filled: true,
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.lightBlueAccent)),
                            hintText: "E-mail",
                            hintStyle: formStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: TextFormField(
                          //keyboardType: TextInputType.numberWithOptions(),
                          controller: _passwordController,
                          validator: (input) {
                            if (input.length < 6) {
                              return "Please enter a password of at least 6 characters";
                            }
                          },
                          onSaved: (input) => _password = input,
                          textAlign: TextAlign.start,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              focusColor: Colors.green,
                              fillColor: Colors.white70,
                              filled: true,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent)),
                              hintText: "Password",
                              hintStyle: formStyle),
                          obscureText: true,
                        ),
                      ),
                      SizedBox(
                        height: mQ.height * 0.02,
                        width: mQ.width * 0.1,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: mQ.height * 0.0,
                        width: mQ.width * 0.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 28.0),
                        child: InkWell(
                          child: Container(
                            height: 50.0,
                            width: 200,
                            child: Material(
                              borderRadius: BorderRadius.circular(10.0),
                              shadowColor: Colors.lightBlueAccent,
                              color: Colors.lightBlue,
                              elevation: 1.0,
                              child: Center(
                                child: _isLoading
                                    ? Center(
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                        ),
                                      )
                                    : Text(
                                        "SIGN IN",
                                        style: TextStyle(
                                            fontSize: 26,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _isLoading = true;
                              signIn().whenComplete(() {
                                setState(() {
                                  _isLoading = false;
                                });
                              });
                            });
                          },
                        ),
                      ),
                    ],
                  )),
                ),
                SizedBox(
                  height: mQ.height * 0.02,
                  width: mQ.width * 0.1,
                ),
                Container(
                  //padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: InkWell(
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "New to ShopMart? ",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                            text: "Signup",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupUI()));
                              }),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: mQ.height * 0.1,
                  width: mQ.width * 0.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sign-In with",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    MaterialButton(
                        textTheme: ButtonTextTheme.primary,
                        onPressed: () async {
                          bool res = await AuthProvider().loginWithGoogle();
                          if (res == false)
                            Container(
                                child: (Text("error logging in with google")));
                          else
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Image.asset(
                            "assets/images/ggg.png",
                            width: 20,
                          ),
                        )),
                  ],
                ),
              ],
            )),
      ),
    ]));
  }
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  Future<void> signIn() async {
    final formState = formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance
                .signInWithEmailAndPassword(email: _email, password: _password))
            .user;
        return Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
