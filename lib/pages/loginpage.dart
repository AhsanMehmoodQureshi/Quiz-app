import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          decoration: InputDecoration(
                            hintText: 'Enter Password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.cyan),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, '/forgotpassword');
                            }, child: const Text('Forgot Password?',style: TextStyle(color: Colors.cyan),textAlign: TextAlign.end,))
                          ],
                        ),
                        const SizedBox(height: 10,),
                        ElevatedButton(onPressed: (){
                          Navigator.pushNamed(context, '/homepage');
                        }, child: const Text('LOGIN'),style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurpleAccent,
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            )
                        ),),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Create an account?'),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, '/signup_page');
                            }, child: const Text('Sign Up',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurpleAccent),))
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                color: Colors.deepPurple,
                                shape: BoxShape.circle
                              ),
                              child: IconButton(onPressed: (){},icon: const Icon(Icons.facebook,color: Colors.white,),),
                            ),
                            const SizedBox(width: 50,),
                            Container(
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.deepPurple,
                                  shape: BoxShape.circle
                              ),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: (){},
                                  child: CircleAvatar(
                                    child: Image.asset('assets/google.png',),
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
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
