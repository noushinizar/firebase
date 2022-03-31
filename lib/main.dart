import 'package:firebase/home_page.dart';
import 'package:firebase/sign_in.dart';
import 'package:firebase/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: signin(),));
}
class myapp extends StatelessWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'SIGN IN',
      theme: ThemeData(
          primaryColor: Colors.teal),
      home: signin(),

    );  }
}
