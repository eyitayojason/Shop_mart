import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return //
        Scaffold(backgroundColor: Color(0xffd6e7ef),
            body:  
            Stack(children: [
                  // Gradient
                  PositionedDirectional(
                    bottom: 600,
                    width: 483,
                    child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 60),
                              child: Text("Checkout",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold)),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(
                                  Icons.shopping_cart,
                                  color: Colors.white,
                                ),
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.white,
                                )
                              ],
                            ), //IconButton(icon: Icon(Icons.shopping_cart), onPressed: null)
                          ],
                        ),
                        width: 490,
                        height: 272,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  const Color(0xffcc54b6),
                                  const Color(0xff666ebb)
                                ]))),
                  ),
                  // Rectangle 2
                  PositionedDirectional(
                    top: 170,
                    start: 17,
                    child: Container(
                        width: 450,
                        height: 113,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xffffffff))),
                  ),
                  // Rectangle 3
                  PositionedDirectional(
                    top: 299,
                    start: 17,
                    child: Container(
                        width: 450,
                        height: 113,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: const Color(0xffffffff))),
                  ),
                  // Rectangle 4
                  PositionedDirectional(
                    top: 430,
                    start: 17,
                    child: Container(
                        width: 450,
                        height: 113,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: const Color(0xffffffff))),
                  ),
                  // Rectangle 5
                  PositionedDirectional(
                    top: 561,
                    start: 17,
                    child: Container(
                        width: 450,
                        height: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(22)),
                            color: const Color(0xffffffff))),
                  ),
                  // Rectangle 6
                  PositionedDirectional(
                    top: 780,
                    start: 0,
                    child: Container(
                        width: 575,
                        height: 75,
                        decoration:
                            BoxDecoration(color: const Color(0xffffffff))),
                  ),
                  // Rectangle 7
                  PositionedDirectional(
                    top: 795,
                    start: 120,
                    child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text("PAY NOW",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(63)),
                            gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  Color(0xff29a7e8),
                                  Color(0xff84d3d2)
                                ]))),
                  )
                ]));
  }
}
