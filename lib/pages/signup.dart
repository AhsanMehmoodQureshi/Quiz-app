
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String countryCodeValue = "+92";
  String countryNameValue = "Pakistan";
  final formGlobalKey = GlobalKey < FormState > ();
  final _controllerfirstName=TextEditingController();
  final _controllerlastName=TextEditingController();
  final _controllerPhoneNumber=TextEditingController();
   late String firstName="";
   late String lastName="";
   late String phoneNumber="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Stack(
          children: [
        Container(
          height: 300,
        decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/background-img.png'),fit: BoxFit.fill)
        ),
        ),
            Positioned(child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Icon(Icons.close,size: 20,color: Colors.white,),
                      const SizedBox(height: 20,),
                      const Text('Sign Up(1/2)\n',style: TextStyle(fontSize: 20,color: Colors.white),),
                      const Text('Personal info',style: TextStyle(fontSize: 20,color: Colors.white),),
                      const SizedBox(height: 60,),
                      Container(
                        padding: const EdgeInsets.all(15),
                        width: MediaQuery.of(context).size.width,
                       // height: 535,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 25.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                15.0, // Move to right 10  horizontally
                                15.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Form(
                          key: formGlobalKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children:  [
                              const SizedBox(height: 20,),
                                 TextFormField(
                                  controller: _controllerfirstName,
                                decoration: const InputDecoration(
                                    labelText: 'First Name',
                                ),
                                   validator: (value){
                                    if (value==null || value.isEmpty){
                                      return 'Please Enter a valid First Name';
                                    }
                                    return null;
                                   },
                              ),
                              const SizedBox(height: 20,),
                               TextFormField(
                                //keyboardType: TextInputType.emailAddress,
                                controller: _controllerlastName,
                                decoration: const InputDecoration(
                                  labelText: 'Last Name',
                                ),
                                 validator: (value){
                                  if (value==null || value.isEmpty){
                                    return 'Please enter a valid Last Name';
                                  }
                                  return null;
                                 },
                              ),
                              const SizedBox(height: 20,),
                              Text('Country',style: TextStyle(color: Colors.grey[500]),),
                              TextFormField(
                                decoration: InputDecoration(
                                    prefixIcon: Row(
                                      children: [
                                        Expanded(flex:9,child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            CountryCodePicker(
                                              padding: const EdgeInsets.all(0),
                                              showFlag: true,
                                              onChanged:  _onCountryChange,
                                              showCountryOnly: true,
                                              initialSelection: 'PK',

                                              // onInit: (value) {
                                              //   if(value != null) {
                                              //     _onCountryChange(value);
                                              //   }
                                              // },

                                              favorite: const ['+92','PK'],
                                              showOnlyCountryWhenClosed: true,
                                              alignLeft: true,
                                            )
                                          ],)),
                                        Expanded(flex:1,child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            IconButton(onPressed: (){
                                            }, icon: const Icon(Icons.keyboard_arrow_down)),
                                          ],))
                                      ],
                                    )
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text('Phone Number',style: TextStyle(color: Colors.grey[500]),),
                              Row(
                                children: [
                                  Expanded(flex:1,child: Container(
                                    padding: const EdgeInsets.only(bottom: 8,),
                                    decoration:   BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 2,color: Colors.grey.shade400
                                            )
                                        )
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(''+countryCodeValue),
                                      ],
                                    ),
                                  )),
                                  const SizedBox(width: 30,),
                                  Expanded(flex:4,child: Column(
                                    children:  [
                                      TextFormField(
                                        controller: _controllerPhoneNumber,
                                        keyboardType: TextInputType.number,
                                        maxLength: 10,
                                        validator: (value){
                                          if(value==null ||value.isEmpty){
                                            return 'Please Enter a Valid Phone Number';
                                          }
                                          return null;
                                        },
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              ElevatedButton(onPressed: () {
                                setState(() {
                                  firstName=_controllerfirstName.text;
                                  lastName=_controllerlastName.text;
                                  phoneNumber=_controllerPhoneNumber.text;
                                });
                                if (formGlobalKey.currentState!.validate()) {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>  AlertDialog(
                                      actionsAlignment: MainAxisAlignment.start,
                                      title: const Text('Sign Up Data'),
                                      content: const Text('AlertDialog description'),
                                      actions: <Widget>[
                                        widgetData()
                                      ],
                                    ),
                                  );
                                }
                              } ,
                               child: const Text('SIGN UP'),style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 20
                                  ),
                                  primary: Colors.green
                              ),),
                              const SizedBox(height: 20,),
                              RichText(
                                  textAlign: TextAlign.center,
                                  text:  TextSpan(
                                      children: [
                                        const TextSpan(text: 'By creating an account you are agree with our\n ',style: TextStyle(color: Colors.grey,fontSize: 16)),
                                        TextSpan(text: 'Terms and Conditions',
                                          style: const TextStyle(color: Colors.orange,decoration: TextDecoration.underline,fontSize: 16
                                          ),
                                          recognizer: TapGestureRecognizer()..onTap=(){
                                            Navigator.pushNamed(context, '/dropdown');
                                          },),
                                        const TextSpan(text: '  '),
                                        const TextSpan(text: 'and',style: TextStyle(color: Colors.grey,fontSize: 16)),
                                        const TextSpan(text: '  '),
                                         TextSpan(text: 'Privacy Policy',
                                          style: const TextStyle(color: Colors.orange,decoration: TextDecoration.underline,fontSize: 16
                                          ),
                                           recognizer: TapGestureRecognizer()..onTap=(){
                                             showTopSnackBar(
                                               context,
                                               const CustomSnackBar.info(
                                                 message:
                                                 "There is some information. You need to do something with that",
                                               ),
                                             );
                                           }
                                        ),
                                        const TextSpan(text: '  '),
                                        const TextSpan(text: 'Send\n Money India',style: TextStyle(color: Colors.grey,fontSize: 16)),
                                      ]
                                  ))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        )
      ),
    );

  }

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    //print("New Country selected: " + countryCode.dialCode);
    setState(() {
      countryCodeValue= countryCode.dialCode!;
      countryNameValue=countryCode.name!;
    });
  }
  Widget widgetData(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
         Text('FirstName:$firstName'),
         Text('LastName:$lastName'),
         Text('CountryName:'+countryNameValue),
         Text('PhoneNumber:'+countryCodeValue+phoneNumber),
         const SizedBox(height: 15,),
         Center(
           child: TextButton(
             onPressed: () => Navigator.pop(context, 'OK'),
             child: const Text('Confirm'),
           ),
         )
      ],
    );
  }
  // Widget widgetAlertBox(){
  //   return GestureDetector(
  //     onTap: ()  {
  //       showDialog<String>(
  //         context: context,
  //         builder: (BuildContext context) =>  AlertDialog(
  //           actionsAlignment: MainAxisAlignment.start,
  //           title: const Text('Sign Up Data'),
  //           content: const Text('AlertDialog description'),
  //           actions: <Widget>[
  //             widgetData()
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}



