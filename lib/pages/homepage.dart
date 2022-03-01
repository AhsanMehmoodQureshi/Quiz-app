import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Level'),
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
           child: const Text('15'),
         )
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children:   [
                        const Text('Level1',style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Expanded(child: Text('Que.Points\n 40',textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white))),
                            Expanded(child: Text('Que\n 8/10',textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)))
                          ],
                        ),
                        const SizedBox(height: 10,),
                        LinearPercentIndicator(
                          lineHeight: 14.0,
                          percent: 0.8,
                          backgroundColor: Colors.green.shade500,
                          progressColor: Colors.white,
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){
                          Navigator.pushNamed(context, '/quizapp');
                        }, child: const Text('Start'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          primary: Colors.white,
                          onPrimary: Colors.green.shade700,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)
                          )
                        ),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children:   [
                        const Text('Level2',style: TextStyle(color: Colors.white),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            Expanded(child: Text('Que.Points\n 10',textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white))),
                            Expanded(child: Text('Que\n 2/10',textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)))
                          ],
                        ),
                        const SizedBox(height: 10,),
                        LinearPercentIndicator(
                          lineHeight: 14.0,
                          percent: 0.2,
                          backgroundColor: Colors.blue.shade500,
                          progressColor: Colors.white,
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){
                         // Navigator.pushNamed(context, '/signup');
                        }, child: const Text('Start'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              primary: Colors.white,
                              onPrimary: Colors.blue.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                        color: Colors.blue.shade300,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children:   [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.lock,color: Colors.white,),
                            Text('Level3',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text('Need 70 Points to Purchase this level',style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                        color: Colors.red.shade300,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children:   [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.lock,color: Colors.white,),
                            Text('Level4',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text('Need 90 Points to Purchase this level',style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration:  BoxDecoration(
                        color: Colors.amber.shade300,
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      children:   [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.lock,color: Colors.white,),
                            Text('Level5',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        const Text('Need 100 Points to Purchase this level',style: TextStyle(color: Colors.white))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

