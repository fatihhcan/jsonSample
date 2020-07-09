import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SecondScreen extends StatefulWidget {
  SecondScreen({Key key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    //url den alınan veriyi kullanılabilir hale getirelecek
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

Future<Post> postGet() async {
  final reply = await http.get("https://jsonplaceholder.typicode.com/posts/1");

  if (reply.statusCode == 200) {
    return Post.fromJson(json.decode(reply.body));
  } else {
    throw Exception("ERROR:& ${reply.statusCode}");
  }
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON - URL Sample"),
      ),
      body: Container(
        child: FutureBuilder<Post>(
            future: postGet(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int userId = snapshot.data.userId;
                int id = snapshot.data.id;
                String title = snapshot.data.title;
                String body = snapshot.data.body;

                return Column(
                  children: <Widget>[
                    Text("userId: $userId"),
                    Text("id: $id"),
                    Text("title: $title"),
                    Text("body: $body"),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("ERROR : ${snapshot.error}");
              }
            }),
      ),
    );
  }
}
