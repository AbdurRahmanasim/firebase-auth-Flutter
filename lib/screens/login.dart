import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/home.dart';
import 'package:firebase_authentication/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailLoginController = TextEditingController() ;
  TextEditingController _passwordLoginController = TextEditingController() ;



 login(context) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailLoginController.text,
        password: _passwordLoginController.text,
      );
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeView()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login")),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _emailLoginController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email" ,
                ),
              ),
            ),
            SizedBox(height: 20,),


             SizedBox(
              width: 200,
              child: TextField(
                controller: _passwordLoginController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password" ,
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
          login(context) ;
            }, child: Text("Login")),
              ElevatedButton(onPressed: (){
               Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                           return Signup() ;}));
            }, child: Text("Go to SignUp Page"))
          
        ]),
      ),
      
    );
  }
}