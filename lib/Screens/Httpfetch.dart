import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Httppost.dart';

Future<Post> fetchPost() async {
  final response = await http.get(
      'https://jsonplaceholder.typicode.com/photos/1',
      );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Post');
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final int albumId;
  final String url;

  Post({this.userId, this.id, this.title, this.albumId, this.url});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        albumId: json["albumId"],
        url: json["url"]);
  }
}

class HttpFetch extends StatefulWidget {
  HttpFetch({Key key}) : super(key: key);

  @override
  _HttpFetchState createState() => _HttpFetchState();
}

class _HttpFetchState extends State<HttpFetch> {
  Future<Post> futurePost;

  @override
  void initState() {
    super.initState();
    futurePost = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
//      theme: ThemeData(
      //      primarySwatch: Colors.blue,
      //  ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: futurePost,
            builder: (context, snapshot) {
              // if (snapshot.hasData) {
              //   return Text(snapshot.data.title);
              // } else if (snapshot.hasError) {
              //   return Text("${snapshot.error}");
              // }

              if (snapshot.hasData) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Httppost()));
                  },
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.network(snapshot.data.url),
                  ),
                );
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
