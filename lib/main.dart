import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sandbox',
      home: MyHomePage(title: 'Flutter Sandbox'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder(
            future: _someData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Text("Loading..."),
                );
              } else {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data['rating'].toString(),
                      style: TextStyle(fontSize: 40.0),
                    ),
                    RaisedButton(
                      onPressed: () {
                      // TODO: Increment the number
                      // https://stackoverflow.com/questions/34458930/most-efficient-way-to-increment-a-value-of-everything-in-firebase/55548224#55548224
                      },
                      child: Text("Increment"),
                    )
                  ],
                ));
              }
            }));
  }
}

Future _someData() async {
  DocumentSnapshot result = await Firestore.instance
      .collection('ratings')
      .document('LqnIBuLeytLerFNQvw3U')
      .get();
  return result;
}
