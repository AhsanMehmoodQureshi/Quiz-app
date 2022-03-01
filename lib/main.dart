import 'package:api/pages/dropdown.dart';
import 'package:api/pages/forgotpassword.dart';
import 'package:api/pages/homepage.dart';
import 'package:api/pages/loginpage.dart';
import 'package:api/pages/quizapp.dart';
import 'package:api/pages/result.dart';
import 'package:api/pages/signup.dart';
import 'package:api/pages/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/loginpage',
      routes: {
        '/signup':(context)=>const Signup(),
        '/dropdown':(context)=>const Dropdown(),
        '/loginpage':(context)=>const LoginPage(),
        '/signup_page':(context)=>const SignupPage(),
        '/forgotpassword':(context)=>const ForgotPassword(),
        '/homepage':(context)=>const HomePage(),
        '/quizapp':(context)=>const QuizApp(),
        // '/result':(context)=>Result(),

      },
    );
  }
}
