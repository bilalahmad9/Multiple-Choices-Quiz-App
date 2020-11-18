import 'package:flutter/material.dart';
import 'Quiz1.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyQuizApp(),
    ),
  );
}

class MyQuizApp extends StatefulWidget {
  @override
  _MyQuizAppState createState() => _MyQuizAppState();
}

class _MyQuizAppState extends State<MyQuizApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Multiple Choice Quiz"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          MaterialButton(
              height: 50.0,
              onPressed: (){
                StartQuiz();
              },
              color: Colors.black,
              child: Text(
                "Click to Start Quiz",
                style: TextStyle(fontSize: 20.0, color: Colors.amber),
              ),
          ),
          ],
        ),
      ),
    );
  }

  void StartQuiz(){
    setState(() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => quiz1()));
    });
  }



}
