import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class MyQuiz{
  var images = [
    "pak","flag1","flag2","flag3"
  ];


  var questions = [
    "1)  Who was the first President of the Constitution Assembly of Pakistan?",
    "2)  After how many years did Pakistan got its first constitution?",
    "3)  When Mohammad Ali Bogra presented Bogra Formula in the assembly?",
    "4)  When the Constituent Assembly passed the Objective Resolution?",
   /* "5)  Who was Mohammad Ali Bogra?",
    "6)  When Mohammad Ali Bogra presented Bogra Formula in the assembly?",
    "7)  What is the other name of Mohammad Ali Bogra Formula?",
    "8)  When first constitution of Pakistan was enforced?",
    "9)  What is the other name of Mohammad Ali Bogra Formula?",
    "10)  When first constitution of Pakistan was enforced?",
*/
  ];


  var choices = [
    ["Moulvi Tameez-ud-Din", "Sardar Abdur Rab Nishtar", "Liaquat Ali Khan", "Quaid-e-Azam"],
    ["9 years", "7 years", "5 years", "2 years"],
    ["October 1953", "June 1953", "July 1953", "May 1953"],
    ["12 March, 1949", "9 June, 1949", "19 July, 1949", "15 May, 1949"]
  ];


  var correctAnswers = [
    "Quaid-e-Azam", "9 years", "October 1953", "12 March, 1949"
  ];
}

var finalscore = 0;
var questionNumber = 0;
var quiz = MyQuiz();


class quiz1 extends StatefulWidget {
  @override
  _quiz1State createState() => _quiz1State();
}

class _quiz1State extends State<quiz1> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async => false,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20.0)),

              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),

                    Text("Score: $finalscore",
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                    ),
                  ],
                ),
              ),

              Padding(padding: EdgeInsets.all(10.0)),

              Image.asset(
                "images/${quiz.images[questionNumber]}.jpg"
              ),

              Padding(padding: EdgeInsets.all(20.0)),

              Text(quiz.questions[questionNumber],
              style: TextStyle(
                fontSize: 20.0,
              ),
              ),

              Padding(padding: EdgeInsets.all(20.0)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  
                  MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blue,
                      onPressed: (){

                        if(quiz.choices[questionNumber][0] == quiz.correctAnswers[questionNumber]){
                          debugPrint("Correct Answer");
                          finalscore++;
                        }else{
                          debugPrint("Wrong Answer");
                        }

                        UpdateQuestion();
                      },
                    child: Text(
                      quiz.choices[questionNumber][0],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blue,
                    onPressed: (){

                      if(quiz.choices[questionNumber][1] == quiz.correctAnswers[questionNumber]){
                        debugPrint("Correct Answer");
                        finalscore++;
                      }else{
                        debugPrint("Wrong Answer");
                      }

                      UpdateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][1],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blue,
                    onPressed: (){

                      if(quiz.choices[questionNumber][2] == quiz.correctAnswers[questionNumber]){
                        debugPrint("Correct Answer");
                        finalscore++;
                      }else{
                        debugPrint("Wrong Answer");
                      }

                      UpdateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][2],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),



                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  MaterialButton(
                    minWidth: 120.0,
                    color: Colors.blue,
                    onPressed: (){

                      if(quiz.choices[questionNumber][3] == quiz.correctAnswers[questionNumber]){
                        debugPrint("Correct Answer");
                        finalscore++;
                      }else{
                        debugPrint("Wrong Answer");
                      }

                      UpdateQuestion();
                    },
                    child: Text(
                      quiz.choices[questionNumber][3],
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),



                ],
              ),

              Padding(padding: EdgeInsets.all(30.0)),

              Container(
                alignment: Alignment.bottomCenter,
                child: MaterialButton(
                  minWidth: 240.0,
                  color: Colors.red,
                  height: 40.0,
                  onPressed: resetQuiz,
                  child: Text(
                    "Quit",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz()
  {
    setState(() {
      Navigator.pop(context);
      finalscore = 0;
      questionNumber = 0;
    });
  }

  void UpdateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length-1){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Summary(score: finalscore)));
      }else{
        questionNumber++;
      }
    });
  }

}
class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async => false,
        child: Scaffold(

          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text("Final Score: $score",
                style: TextStyle(
                  fontSize: 25.0,
                ),
                ),
                Padding(padding: EdgeInsets.all(10.0)),

                MaterialButton(
                   color: Colors.red,
                    onPressed: (){
                     questionNumber = 0;
                     finalscore = 0;
                     Navigator.pop(context);
                    },

                   child: Text(
                    "Reset Quiz",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
