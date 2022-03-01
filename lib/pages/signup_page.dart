import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration:  BoxDecoration(
                image: DecorationImage(image: const AssetImage('assets/img.png'),fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.03), BlendMode.dstATop)
                ),
              ),
            ),
            Positioned(child: IconButton(onPressed: (){
              Navigator.pushNamed(context, '/loginpage');
            }, icon: const Icon(Icons.arrow_back_outlined))),
            Positioned(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration:  const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/login_design_quiz_icon.png'),
                        ),
                      ),
                      // child: ,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:   [
                        const Text('NAME',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        const TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('EMAIL',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        const TextField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('PASSWORD',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        const TextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        const Text('PHONE',style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                        const TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                          maxLength: 11,
                        ),
                        const SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){}, child: const Text('SIGN UP'),style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                        ),),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

