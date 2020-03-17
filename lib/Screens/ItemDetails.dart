import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';
import 'ProfilePage.dart';

class ItemDetails extends StatefulWidget {
  final String title;
  final String images;
  final String price;

  ItemDetails({this.images, this.title, this.price});

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Item Detail"),
        centerTitle: true,
      ),
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => Cart()));
              },
              child: Icon(Icons.shopping_cart),
            ),
            CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.red,
              child: Text(
                "0",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height, //300.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100.0),
                  bottomLeft: Radius.circular(100.0),
                ),
                image: DecorationImage(
                    image: AssetImage(widget.images), fit: BoxFit.fitHeight)),
          ),
          Container(
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.blueAccent.withAlpha(50),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100.0),
                bottomLeft: Radius.circular(100.0),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Item title",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: Colors.lightBlueAccent,
                                  size: 20.0,
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text(
                                  "${widget.price}",
                                  style: TextStyle(color: Colors.black),
                                )
                              ],
                            ),
                            Text(
                              "N${widget.price}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red[500],
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    width: screenSize.width,
                    height: 150.0,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                child: 
                                 Image.asset(widget.images),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5.0, right: 5.0),
                                height: 140.0,
                                width: 100.0,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent.withAlpha(0)),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                Card(
                  //shape:      //ShapeBorder.lerp(a, b, t),
                  child: Container(
                    width: screenSize.width,
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Description",
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc,n",
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
