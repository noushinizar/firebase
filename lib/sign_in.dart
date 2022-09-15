
import 'package:firebase/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  _signinState createState() => _signinState();
}

class _signinState extends State<signin> {
  final TextEditingController phonecontroler = TextEditingController();
  final TextEditingController otpcontroler = TextEditingController();
  String verificationIdReceived="";
  bool otpVisible=false;
  /*late bool _sucess;
  late String _userEmail;*/
/*
    void _register() async {
    final User? user = (
        await _auth.signInWithEmailAndPassword(email: emailcontroler.text, password: passwordcontroler.text)
    ).user;

    if(user != null) {
      setState(() {
        _sucess = true;
        print(_sucess);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    } else {
      setState(() {
        _sucess = false;
      });
    }
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('SIGN IN',textAlign: TextAlign.center,)
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height:180,
                  width: 180.0,
                  child: Divider(
                    color: Colors.cyan,
                  ),
                ),
          Expanded(
          child:Padding(padding: EdgeInsets.all(5),
          child: TextField(
            controller: phonecontroler,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'phone',
              fillColor: Colors.white,
              filled: true,
            ),
          ),),
      ),

    Expanded(
        child:Padding(padding: EdgeInsets.all(5),
          child: Visibility(
            visible: false,
        child: TextField(
          controller: otpcontroler,
             keyboardType: TextInputType.text,
              decoration: InputDecoration(
               border: OutlineInputBorder(),
               hintText: 'otp code',
                fillColor: Colors.white,
             filled: true,
           ) ,
        ),),),
     ) ,
                Expanded(
                  child:Padding(padding: EdgeInsets.all(10.0),
                      child: TextButton(style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                      ), onPressed: (){
                        verifynumber();
                      },
                          child: Text(otpVisible? "LOGIN" : "verify",))),),

       ],
            ),

        ),
      ),

    );
  }
  void verifynumber(){
    _auth.verifyPhoneNumber(phoneNumber: phonecontroler.text,
        verificationCompleted: (PhoneAuthCredential credential){
          _auth.signInWithCredential(credential).then((value){
            print("you are logged in successfully");
          });
        },
        verificationFailed: (FirebaseAuthException exception){
          print(exception.message);
        },
        codeSent: (String verificationId,int? resendToken){
          verificationIdReceived = verificationId;
          otpVisible=true;
          setState(() {

          });
        },
        codeAutoRetrievalTimeout: (String verificationId){

        });
  }
}

