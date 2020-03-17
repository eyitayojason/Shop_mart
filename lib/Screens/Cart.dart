import 'package:flutter/material.dart';

import 'CheckoutPage.dart';

class Cart extends StatelessWidget {
  final List<Map> items = [{}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*  Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                  child: Text(
                    "CART",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  )),*/
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16.0),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(right: 30.0, bottom: 10.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(5.0),
                            elevation: 3.0,
                            child: Container(
                                padding: EdgeInsets.all(16.0),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                        height: 80,
                                        child: Image.asset(
                                            "assets/images/chanel.jpg")),
                                    SizedBox(width: 10.0),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Title",
                                          // items[index]["title"],

                                          style: TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 20.0),
                                        Text("{items[index]['price']}",
                                            style: TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold))
                                      ],
                                    ))
                                  ],
                                )),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          right: 15,
                          child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            child: MaterialButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              padding: EdgeInsets.all(0.0),
                              color: Colors.pinkAccent,
                              child: Icon(Icons.clear, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "SubTotal",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Delivery",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 16.0),
                      ),
                      SizedBox(height: 11.0),
                      Text(
                        "Cart SubTotal",
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            height: 50.0,
                            color: Colors.pinkAccent,
                            child: Text(
                              "Checkout".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => CheckoutPage()));
                            },
                          ))
                    ],
                  ))
            ]),
      ),
    );
  }
}
