import 'dart:ui';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:shop_mart/Screens/ThankYou.dart';
import 'package:shop_mart/Services/Crud.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupUI extends StatefulWidget {
  @override
  SignupUIState createState() => SignupUIState();
}

TextStyle defaultStyle =
    TextStyle(fontSize: 80, color: Colors.black, fontWeight: FontWeight.w700);
TextStyle formStyle = TextStyle(
  color: Colors.blueGrey,
  fontWeight: FontWeight.bold,
);

class SignupUIState extends State<SignupUI> {
  var email;
  var username;
  var phone;
  var password;

  crudMedthods crudObj = new crudMedthods();
  var isLoading = false;
  TextEditingController emailController;
  TextEditingController passwordController;

  TextEditingController phoneController;
  TextEditingController usernameController;

  //bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController(text: "");
    passwordController = TextEditingController(text: "");
    phoneController = TextEditingController(text: "");
    usernameController = TextEditingController(text: "");
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        Form(
          // autovalidate: true,
          key: formkey,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                "assets/images/11439.png",
              ),
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.09), BlendMode.dstATop),
              fit: BoxFit.cover,
            )),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    "Signup.",
                    style: defaultStyle,
                  ),
                ),
                //SizedBox(
                //height: 70,
                //width: 0.1,
                // ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: (Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          //autovalidate: true,
                          controller: emailController,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please Enter An Email";
                            } else if (!input.contains("@")) {
                              return "Please Enter A Valid Email";
                            }
                          },
                          onSaved: (input) => email = input,
                          onChanged: (value) {
                            this.email = value;
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent)),
                              labelText: "Email",
                              labelStyle: formStyle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: passwordController,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Please Enter Password";
                            } else if (input.length < 8) {
                              return "Password must be eight characters long";
                            }
                          },
                          onSaved: (input) => password = input,
                          onChanged: (value) {
                            this.password = value;
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent)),
                              labelText: "Password",
                              labelStyle: formStyle),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: phoneController,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Enter Number";
                            } else if (input.contains(new RegExp(r'[A-Z]'))) {
                              return "Please Enter A valid Number";
                            }
                          },
                          onChanged: (value) {
                            this.phone = value;
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent)),
                              labelText: "Mobile No.",
                              labelStyle: formStyle),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextFormField(
                          controller: usernameController,
                          validator: (input) {
                            if (input.isEmpty) {
                              return "Enter Username";
                            }
                          },
                          onChanged: (value) {
                            this.username = value;
                          },
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent)),
                              labelText: "Username",
                              labelStyle: formStyle),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 65.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(40.0),
                          shadowColor: Colors.lightBlueAccent,
                          color: Colors.lightBlue,
                          elevation: 4.0,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isLoading = true;
                                signUp().whenComplete(() {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              });
                            },
                            child: Center(
                              child: isLoading
                                  ? Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : Text(
                                      "SIGN UP",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        height: 65.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(40.0),
                          //shadowColor: Colors.white,
                          color: Colors.white,
                          elevation: 4.0,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: Center(
                              child: Text(
                                "GO BACK",
                                style: TextStyle(
                                    fontSize: 19,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment(0.0, 0.0),
                        margin: EdgeInsets.only(top: 10.0, right: 0.0),
                        child: InkWell(
                          child: RichText(
                            text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Already a member? ",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign in",
                                  style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                      SizedBox(height: 40.0);
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> signUp() async {
    final formState = formkey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        setState(() {
          isLoading = true;
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Thanks()));
          crudObj.addData({
            "email": this.email,
            "password": this.password,
            "username": this.username,
            "Phone": this.phone
          }).whenComplete(() {
            setState(() {
              isLoading = false;
            });
            //  dialogTrigger(context);
          }).catchError((e) {
            print(e);
          });
        });
      } catch (e) {
        print(e.message);
      }
    }
  }
}
