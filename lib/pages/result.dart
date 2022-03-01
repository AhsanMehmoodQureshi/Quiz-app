import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int score;
   Result(this.score, {Key? key}) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // late int score;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Result'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
          Navigator.pushNamed(context, '/homepage');
        },),
      ),
      body: SafeArea(
          child: Container(
            color: Colors.teal,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text('Congratulation',style: TextStyle(color: Colors.white,fontSize: 30),),
                  Text('Your Marks: ${widget.score}',style: const TextStyle(color: Colors.white,fontSize: 30),),
            ],
              ),
            ),
          ),
      ),
    );
  }
}
