import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                        const SizedBox(height: 30,),
                        ElevatedButton(onPressed: (){}, child: const Text('FORGOT PASSWORD'),style: ElevatedButton.styleFrom(
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
