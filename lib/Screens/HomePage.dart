import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_mart/Screens/Httpfetch.dart';
import 'package:shop_mart/Services/Dashboard.dart';
//import 'package:shop_mart/Services/Dashboard.dart';
import 'ItemDetails.dart';
import 'ProfilePage.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  const HomePage({Key key, this.user}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.lightBlueAccent,
          animationCurve: Curves.easeInOutSine,
          animationDuration: Duration(milliseconds: 300),
          height: 45,
          items: <Widget>[
            Icon(
              Icons.home,
              size: 25,
            ),
            //Text('Home'),

            Icon(
              Icons.category,
              size: 25,
            ),
            //Text('Category'),

            GestureDetector(
                child: Icon(Icons.account_circle, size: 25),
                onDoubleTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settings()));
                }),
            //Text('Profile'),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                CarouselSlider(
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 900),
                  height: 500,
                  items: <Widget>[
                    Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/perfume.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomRight,
                                    colors: [
                                  Colors.black.withOpacity(.8),
                                  Colors.black.withOpacity(.2)
                                ])),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(
                                                Icons.favorite,
                                              ),
                                              color: Colors.white,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DashboardPage()));
                                              }),
                                          IconButton(
                                              icon: Icon(Icons.shopping_cart,
                                                  color: Colors.white),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ItemDetails()));
                                              })
                                        ]),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(children: <Widget>[
                                        Text("Latest Products",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HttpFetch()));
                                            },
                                            child: Text(
                                              "SEE MORE",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  //fontSize: 30,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                            size: 15,
                                          )
                                        ])
                                      ]),
                                    )
                                  ]),
                            ))),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Categories",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text("All")
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/coco_chanel.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeCategory(
                                images: "assets/images/coco_chanel.jpg",
                                title: "Perfume",
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/makeup.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeCategory(
                                  images: "assets/images/makeup.jpg",
                                  title: "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfumebottle.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeCategory(
                                  images: "assets/images/perfumebottle.jpg",
                                  title: "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfume2.jpg",
                                              title: "Perfume Oil",
                                              price: "1000",
                                            )));
                              },
                              child: makeCategory(
                                  images: "assets/images/perfume2.jpg",
                                  title: "Perfume Oil"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/aqua.jpg",
                                            title: "Perfume" "Perfume")));
                              },
                              child: makeCategory(
                                  images: "assets/images/aqua.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images:
                                                "assets/images/coco_chanel.jpg",
                                            title: "CocoChanel",
                                            price: "3000")));
                              },
                              child: makeCategory(
                                  images: "assets/images/coco_chanel.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/makeup.jpg",
                                            price: "1200",
                                            title: "Makeup")));
                              },
                              child: makeCategory(
                                  images: "assets/images/makeup.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfumebottle.jpg",
                                              price: "900",
                                              title: "Perfbottle",
                                            )));
                              },
                              child: makeCategory(
                                  images: "assets/images/perfumebottle.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfumebottle.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeCategory(
                                  images: "assets/images/perfumebottle.jpg",
                                  title: "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfume2.jpg",
                                              title: "Perfume Oil",
                                              price: "1000",
                                            )));
                              },
                              child: makeCategory(
                                  images: "assets/images/perfume2.jpg",
                                  title: "Perfume Oil"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/aqua.jpg",
                                            title: "Perfume" "Perfume")));
                              },
                              child: makeCategory(
                                  images: "assets/images/aqua.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images:
                                                "assets/images/coco_chanel.jpg",
                                            title: "CocoChanel",
                                            price: "3000")));
                              },
                              child: makeCategory(
                                  images: "assets/images/coco_chanel.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/makeup.jpg",
                                            price: "1200",
                                            title: "Makeup")));
                              },
                              child: makeCategory(
                                  images: "assets/images/makeup.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemDetails(
                                                images:
                                                    "assets/images/perfumebottle.jpg",
                                                price: "900",
                                                title: "Perfbottle",
                                              )));
                                },
                                child: makeCategory(
                                    images: "assets/images/makeup.jpg",
                                    title: "Perfume" "Perfume"))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Container(
                              child: Text(
                                "Featured",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Text("All")
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 100,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfumebottle.jpg",
                                              price: "900",
                                              title: "Perfbottle",
                                            )));
                              },
                              child: makeFeatured(
                                  images: "assets/images/perfumebottle.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfumebottle.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeFeatured(
                                  images: "assets/images/perfumebottle.jpg",
                                  title: "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfume2.jpg",
                                              title: "Perfume Oil",
                                              price: "1000",
                                            )));
                              },
                              child: makeFeatured(
                                  images: "assets/images/perfume2.jpg",
                                  title: "Perfume Oil"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/aqua.jpg",
                                            title: "Perfume" "Perfume")));
                              },
                              child: makeFeatured(
                                  images: "assets/images/aqua.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images:
                                                "assets/images/coco_chanel.jpg",
                                            title: "CocoChanel",
                                            price: "3000")));
                              },
                              child: makeFeatured(
                                  images: "assets/images/coco_chanel.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/makeup.jpg",
                                            price: "1200",
                                            title: "Makeup")));
                              },
                              child: makeFeatured(
                                  images: "assets/images/makeup.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ItemDetails(
                                                images:
                                                    "assets/images/perfumebottle.jpg",
                                                price: "900",
                                                title: "Perfbottle",
                                              )));
                                },
                                child: makeFeatured(
                                    images: "assets/images/makeup.jpg",
                                    title: "Perfume" "Perfume")),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/makeup.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeFeatured(
                                  images: "assets/images/makeup.jpg",
                                  title: "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfumebottle.jpg",
                                              title: "Perfume",
                                              price: "1000",
                                            )));
                              },
                              child: makeFeatured(
                                  images: "assets/images/perfumebottle.jpg",
                                  title: "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                              images:
                                                  "assets/images/perfume2.jpg",
                                              title: "Perfume Oil",
                                              price: "1000",
                                            )));
                              },
                              child: makeFeatured(
                                  images: "assets/images/perfume2.jpg",
                                  title: "Perfume Oil"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images: "assets/images/aqua.jpg",
                                            title: "Perfume" "Perfume")));
                              },
                              child: makeFeatured(
                                  images: "assets/images/aqua.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ItemDetails(
                                            images:
                                                "assets/images/coco_chanel.jpg",
                                            title: "CocoChanel",
                                            price: "3000")));
                              },
                              child: makeFeatured(
                                  images: "assets/images/coco_chanel.jpg",
                                  title: "Perfume" "Perfume"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget makeCategory({images, title}) {
  return AspectRatio(
      aspectRatio: 2 / 2.2,
      child: Container(
          margin: EdgeInsets.only(right: 20),
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(images), fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.0)
            ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )));
}

Widget makeFeatured({images, title, price}) {
  return AspectRatio(
      aspectRatio: 3 / 2.1,
      child: Container(
          margin: EdgeInsets.only(right: 20),
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage(images), fit: BoxFit.cover)),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.0)
            ])),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 9,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )));
}
