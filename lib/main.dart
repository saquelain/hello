import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {

  TextEditingController sampledata1 = new TextEditingController();
  TextEditingController sampledata2 = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('adding data to firebase'),
      ),
      body: Container(
        padding: EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: sampledata1,
                decoration: InputDecoration(
                  hintText: 'sample data 1'
                ),
              ),
              SizedBox(height: 10.0,),
              TextFormField(
                controller: sampledata2,
                decoration: InputDecoration(
                  hintText: 'sample data 2'
                ),
              ),
              SizedBox(height: 10.0,),
              FlatButton(
                onPressed: (){
                  Map <String, dynamic> data = {"field1": sampledata1.text, "field2": sampledata2.text};
                  FirebaseFirestore.instance.collection("test").add(data);
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      )
    );
  }
}
