import 'package:flutter/material.dart';

import 'login.dart';

class Thanks extends StatelessWidget {
  TextStyle defaultStyle =
      TextStyle(fontSize: 50, color: Colors.black, fontWeight: FontWeight.w400);
  TextStyle formStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Container(
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
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Text(
                "THANK YOU FOR REGISTERING",
                style: defaultStyle,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 90,
            ),
            FlatButton(
                color: Colors.blue,
                autofocus: true,
                colorBrightness: Brightness.dark,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  "Login",
                  style: formStyle,
                ))
          ]))
    ]));
  }
}
