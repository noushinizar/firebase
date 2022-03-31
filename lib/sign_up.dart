import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;
class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {
  final TextEditingController emailcontroler = TextEditingController();
  final TextEditingController passwordcontroler = TextEditingController();
  late bool _sucess;
  late String _userEmail;

  void _register() async {
    final User? user = (
        await _auth.createUserWithEmailAndPassword(email: emailcontroler.text, password: passwordcontroler.text)
    ).user;

    if(user != null) {
      setState(() {
        _sucess = true;

      });
    } else {
      setState(() {
        _sucess = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('SIGN UP',textAlign: TextAlign.center,)
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
                    controller:emailcontroler ,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),),
              ),

              Expanded(
                child:Padding(padding: EdgeInsets.all(5),
                  child: TextField(
                    controller: passwordcontroler,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                      fillColor: Colors.white,
                      filled: true,
                    ) ,
                  ),),
              ) ,
              Expanded(
                child:Padding(padding: EdgeInsets.all(10.0),
                    child: TextButton(style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                    ), onPressed: (){
                      _register();
                    },

                        child: Text('SIGN UP',))),),

            ],
          ),

        ),
      ),

    );
  }
}


