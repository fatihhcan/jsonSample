import 'package:flutter/material.dart';
import 'dart:convert';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON - Local Sample"),
      ),
      body: Container(
        padding: EdgeInsets.all(35),
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("asset/data/users.json"),
            builder: (context, operation) {
              //json verisini aldık ve dönüştürme işlemni yapıyoruz
              user = jsonDecode(operation.data.toString());
              //liste olarak aldğımız veriyi, listenin her verisini index işlemi yapıyoruz
              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: Colors.orangeAccent,
                    child: Column(
                      children: <Widget>[
                        Text(
                          "User Name: " + user[index]["Name"],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("User Surname: " + user[index]["Surname"]),
                        Text("User Number:  ${user[index]["Number"]}"),
                        Text("User Gender: " + user[index]["Gender"]),
                        Text("User School Name: " +
                            user[index]["School"]["Name"]),
                      ],
                    ),
                  );
                },
                itemCount: user == null ? 0 : user.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
