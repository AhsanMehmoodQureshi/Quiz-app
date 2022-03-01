import 'dart:async';
import 'package:api/pages/appclasses.dart';
import 'package:api/pages/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';



  class QuizApp extends StatefulWidget {
    const QuizApp({Key? key}) : super(key: key);

    @override
    _QuizAppState createState() => _QuizAppState();
  }
  
  class _QuizAppState extends State<QuizApp> {
    Future<List<Quiz>>  getData() async {
      const  url = 'https://quizapi.io/api/v1/questions?apiKey=KyRIFpojYeXQg4W5wItIek2xC8eCrga8IkmBVFQn&limit=5';
      final response= await http.get(Uri.parse(url));
      if (response.statusCode==200){
        final body=response.body;
        final quiz = quizFromJson(body);
        allQuestion.addAll(quiz);
        print(quiz);
       // allQuestion.clear();
       // myList==allQuestion;
       //  setState(() {
       //    allQuestion;
       //  });
        return quiz;
      } else{
        throw Exception('Failed to load album');
      }
    }
    // How to Start Timer
    static const maxSeconds=60;
    int seconds=maxSeconds;
    Timer?timer;
     starttime(){
      timer=Timer.periodic(const Duration(seconds: 1), (timer) {
        if(mounted) {
          setState(() {
          if(seconds>0){
            seconds=seconds-1;
          }
          if(seconds==0 && questionNo<4 && allQuestion.isNotEmpty ){
            questionNo=questionNo+1;
            seconds=seconds+60;
            percentage=percentage+0.2;
            _isButtonDisabled = true;
            color  = Colors.teal;
            color1 = Colors.teal;
            color2 = Colors.teal;
            color3 = Colors.teal;
          }
          //var executed = false;
          // function() {
          //   if (!executed) {
          //     executed = true;
          //     if(seconds==0 && questionNo==5) {
          //       showDialog(context: context, builder: (BuildContext context){
          //         return AlertDialog(
          //           title: const Text('Time is finished'),
          //           actions: [
          //             TextButton(onPressed: (){
          //               Navigator.pop(context);
          //               // Navigator.pushNamed(context, '/homepage');
          //             }, child: const Text('ok'))
          //           ],
          //         );
          //       });
          //     }
          //   }
          // }
          if(allQuestion.isEmpty){
            seconds==0;
            questionNo==0;
          }
          if(questionNo==4 && seconds==0){
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Result(score)),
                  (Route<dynamic> route) => false,
            );
          }
        });
        }
      });
    }
    @override
  void initState() {
      super.initState();
      //if(allQuestion.isNotEmpty)
        starttime();
    getData().then((Quiz) {
      setState(() {
        allQuestion = Quiz;
      });
    });
  }
    late  List<Quiz> allQuestion = [];
    int questionNo = 0;
    int score=0;
    double percentage=0.2;
    bool _isButtonDisabled=true;
    Color color = Colors.teal;
    Color color1 = Colors.teal;
    Color color2 = Colors.teal;
    Color color3 = Colors.teal;
    @override
    Widget build(BuildContext context) {
       getData();
     // allQuestion=getData() as List<Quiz>;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
          backgroundColor: Colors.deepPurpleAccent,
          actions: [
            Container(
              width: 35,
              alignment: Alignment.center,
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2,color: Colors.white)
              ),
              child: const Text('16'),
            )
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child:  Column(
              children: [
                Stack(
                  children: [
                    // CLIPPATH POLYGON
                    ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        color: Colors.deepPurpleAccent.shade200,
                      ),
                      clipper: CustomClipPath(),
                    ),
                    // QUESTION AND ANSWER
                    Positioned(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 90,
                              alignment: Alignment.center,
                              decoration:  BoxDecoration(
                                color: Colors.deepPurpleAccent[100],
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(100),
                                  bottomRight: Radius.circular(100),
                                ),
                              ),
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if(allQuestion.isEmpty) const Text('0/5'),
                                  if(allQuestion.isNotEmpty) Text('${questionNo+1}/5')
                                ],
                              ),
                            ),
                            const SizedBox(height: 15,),
                            Row(
                              children: [
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:     const [
                                    Text('       36 ',style: TextStyle(color: Colors.white)),
                                  ],
                                )),
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children:  const [
                                    Text('45      ',style: TextStyle(color: Colors.white))
                                  ],
                                ))
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                 if(allQuestion.isNotEmpty)LinearPercentIndicator(
                                    lineHeight: 14.0,
                                    percent: percentage,
                                    backgroundColor: Colors.deepPurpleAccent.shade100,
                                    progressColor: Colors.deepPurpleAccent.shade700,
                                  ),
                                  if(allQuestion.isEmpty)LinearPercentIndicator(
                                    lineHeight: 14.0,
                                    percent: 0.0,
                                    backgroundColor: Colors.deepPurpleAccent.shade100,
                                    progressColor: Colors.deepPurpleAccent.shade700,
                                  ),
                                  const SizedBox(height: 15,),
                                   if(allQuestion.isNotEmpty)Text('Question  ${allQuestion[questionNo].question}',style: const TextStyle(color: Colors.white),),
                                  if(allQuestion.isEmpty)Column(
                                    children: const [
                                      CircularProgressIndicator(color: Colors.amber,),
                                      Text('Please wait...')
                                    ],
                                  )
                                  //const Text('First Human Transplant Operation Conducted by Dr.Christiaan Barnard on Louis Washkansky was conducted in',style: TextStyle(color: Colors.white,wordSpacing: 10),),
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                const SizedBox(height: 50,),
                Container(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            alignment: Alignment.center,
                            decoration:  const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.teal
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if(allQuestion.isNotEmpty)Text(seconds.toString(),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                if(allQuestion.isEmpty)const Text('0',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          )
                        ],
                      )),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 35,
                            height: 35,
                            decoration:  BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.deepOrange[400]
                            ),
                            child: IconButton(onPressed: (){
                             if(mounted){
                               setState(() {
                                 if(questionNo<4 && allQuestion.isNotEmpty && _isButtonDisabled!=true){
                                   questionNo++;
                                   color=Colors.teal;
                                   color1 = Colors.teal;
                                   color2 = Colors.teal;
                                   color3 = Colors.teal;
                                   seconds=60;
                                   percentage=percentage+0.2;
                                   _isButtonDisabled = true;
                                 }
                                 if(questionNo==4 && seconds<60){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>  Result(score)));
                                 }
                                 // questionNo = questionNo+1;
                                 // myList.clear();
                               });
                             }
                            }, icon: const Icon(Icons.skip_next_rounded,size: 20,color: Colors.white,)),
                          )
                        ],
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
               // MULTIPLE CHOICE
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      //color= Colors.green;
                      _isButtonDisabled ?
                     setState(() {
                        _isButtonDisabled=false;
                       if (allQuestion[questionNo].correctAnswers.answerACorrect=="true" ) {
                         score=score+1;
                         color =  Colors.green;
                       }
                       if (allQuestion[questionNo].correctAnswers.answerACorrect=="false") {
                         color= Colors.red;
                       }
                        if (allQuestion[questionNo].correctAnswers.answerBCorrect=="true" ) {
                         color1=  Colors.green;
                       }
                         if (allQuestion[questionNo].correctAnswers.answerCCorrect=="true" ) {
                         color2=  Colors.green;
                       }
                         if (allQuestion[questionNo].correctAnswers.answerDCorrect=="true" ) {
                         color3=  Colors.green;
                       }
                     }) :null;
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                     // color: color,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex:0,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(8),
                                decoration:  const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                alignment: Alignment.center,
                                child:  const Text('A',style: TextStyle(color: Colors.green),),
                              )
                            ],
                          )),
                          const SizedBox(width: 25,),
                          Expanded(flex:9,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:     [
                              if(allQuestion.isNotEmpty)Text(allQuestion[questionNo].answers.answerA,style: const TextStyle(color: Colors.white),)
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      _isButtonDisabled ?
                      setState(() {
                        _isButtonDisabled =false;
                        if (allQuestion[questionNo].correctAnswers.answerBCorrect=="true") {
                          color1=  Colors.green;
                          score=score+1;
                        }
                        // if(allQuestion[questionNo].correctAnswers.answerACorrect=="true" ||allQuestion[questionNo].correctAnswers.answerCCorrect=="true" ||allQuestion[questionNo].correctAnswers.answerDCorrect=="true"&& allQuestion[questionNo].correctAnswers.answerBCorrect=="false"){
                        //   color1=  Colors.teal;
                        // }
                          if (allQuestion[questionNo].correctAnswers.answerBCorrect=="false" ) {
                          color1= Colors.red;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerACorrect=="true") {
                          color=  Colors.green;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerCCorrect=="true") {
                          color2=  Colors.green;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerDCorrect=="true") {
                          color3=  Colors.green;
                        }
                      }):null;
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        color: color1,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex:0,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(8),
                                decoration:  const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                alignment: Alignment.center,
                                child:  const Text('B',style: TextStyle(color: Colors.green),),
                              )
                            ],
                          )),
                          const SizedBox(width: 25,),
                          Expanded(flex:9,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:    [
                              if(allQuestion.isNotEmpty) Text(allQuestion[questionNo].answers.answerB,style: const TextStyle(color: Colors.white),)
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      _isButtonDisabled ?
                      setState(() {
                        _isButtonDisabled =false;
                        if (allQuestion[questionNo].correctAnswers.answerCCorrect=="true" ) {
                          color2=  Colors.green;
                          score=score+1;
                        }
                        // if(allQuestion[questionNo].correctAnswers.answerACorrect=="true" ||allQuestion[questionNo].correctAnswers.answerBCorrect=="true" ||allQuestion[questionNo].correctAnswers.answerDCorrect=="true"&& allQuestion[questionNo].correctAnswers.answerCCorrect=="false"){
                        //   color2=  Colors.teal;
                        // }
                          if (allQuestion[questionNo].correctAnswers.answerCCorrect=="false") {
                          color2= Colors.red;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerACorrect=="true") {
                          color=  Colors.green;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerBCorrect=="true") {
                          color1=  Colors.green;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerDCorrect=="true") {
                          color3=  Colors.green;
                        }
                      }):null;
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        color: color2,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex:0,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(8),
                                decoration:  const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                alignment: Alignment.center,
                                child:  const Text('C',style: TextStyle(color: Colors.green),),
                              )
                            ],
                          )),
                          const SizedBox(width: 25,),
                          Expanded(flex:9,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:    [
                              if(allQuestion.isNotEmpty)Text(allQuestion[questionNo].answers.answerC,style: const TextStyle(color: Colors.white),)
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      _isButtonDisabled ?
                      setState(() {
                        _isButtonDisabled = false;
                        if (allQuestion[questionNo].correctAnswers.answerDCorrect=="true" ) {
                          color3=  Colors.green;
                          score=score+1;
                        }
                        // if(allQuestion[questionNo].correctAnswers.answerACorrect=="true" ||allQuestion[questionNo].correctAnswers.answerBCorrect=="true" ||allQuestion[questionNo].correctAnswers.answerCCorrect=="true"&& allQuestion[questionNo].correctAnswers.answerDCorrect=="false"){
                        //   color3=  Colors.teal;
                        // }
                          if (allQuestion[questionNo].correctAnswers.answerDCorrect=="false"  ) {
                          color3= Colors.red;
                        }
                         if (allQuestion[questionNo].correctAnswers.answerACorrect=="true") {
                          color=  Colors.green;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerBCorrect=="true") {
                          color1=  Colors.green;
                        }
                          if (allQuestion[questionNo].correctAnswers.answerCCorrect=="true") {
                          color2=  Colors.green;
                        }
                      }):null;
                    },
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      decoration: BoxDecoration(
                        color: color3,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex:0,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(5),
                                padding: const EdgeInsets.all(8),
                                decoration:  const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle
                                ),
                                alignment: Alignment.center,
                                child:  const Text('D',style: TextStyle(color: Colors.green),),
                              )
                            ],
                          )),
                          const SizedBox(width: 25,),
                          Expanded(flex:9,child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:    [
                              if(allQuestion.isNotEmpty)Text(allQuestion[questionNo].answers.answerD,style: const TextStyle(color: Colors.white),)
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      );
    }
    //List<Quiz> myList = [];
    // List<Quiz> myList = [];
    // Future<Object>  getData() async {
    //   const  url = 'https://quizapi.io/api/v1/questions?apiKey=ivxLL09YaOVszXaiGHtYPuuLVjfmXBB5l5LIQRkX&limit=1';
    //   final response= await http.get(Uri.parse(url));
    //   // var jsonData= jsonDecode(response.body);
    //   if (response.statusCode==200){
    //     final body=response.body;
    //     final quiz = quizFromJson(body);
    //     //List<Quiz> myList = [];
    //     // var element;
    //     // for ( element in quiz) {
    //     //   myList.addAll(quiz);
    //     //
    //     // }
    //     myList.addAll(quiz);
    //     print(quiz);
    //     // addValue();
    //     // allQuestion.clear();
    //     setState(() {
    //       allQuestion = myList;
    //     });
    //     return quiz;
    //   } else{
    //     throw Exception('Failed to load album');
    //   }
    // }
  }



class CustomClipPath extends CustomClipper<Path> {
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var curXPos = 0.0;
    var curYPos = size.height;
    var increment = size.width / 30;
    while (curXPos < size.width) {
      curXPos += increment;
      curYPos = curYPos == size.height ? size.height - 20 : size.height;
      path.lineTo(curXPos, curYPos);
    }
    path.lineTo(size.width, 0);
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
