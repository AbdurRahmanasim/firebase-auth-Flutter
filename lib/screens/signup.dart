import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController _emailSignUpController = TextEditingController() ;
  TextEditingController _passwordSignUpController = TextEditingController() ;



  signup(context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailSignUpController.text,
        password: _passwordSignUpController.text,
      );


      showToastWidget(
   Container(
       padding: EdgeInsets.symmetric(horizontal: 18.0),
       margin: EdgeInsets.symmetric(horizontal: 50.0),
       decoration: ShapeDecoration(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5.0),
           ),
           color: Colors.green[600],
       ),
       child: Row(
           children: [
               Text(
                   'Signed Up SuccessFully',
                   style: TextStyle(
                       color: Colors.white,
                   ),
               ),
               IconButton(
                   onPressed: () {
                       ToastManager().dismissAll(showAnim: true);
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                           return Login();
                       }));
                   },
                   icon: Icon(
                       Icons.login,
                       color: Colors.white,
                   ),
               ),
           ],
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
       ),
   ),
   context: context,
   isIgnoring: false,
   duration: Duration(seconds: 2),
);
    
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
        title: Center(child: Text("SignUp")),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: _emailSignUpController,
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
                controller: _passwordSignUpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password" ,
                ),
              ),
            ),
             ElevatedButton(onPressed: (){
              signup(context) ;
            }, child: Text("SignUp")),
              ElevatedButton(onPressed: (){
               Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                           return Login() ;}));
            }, child: Text("Go to Login Page"))
          
        ]),
      ),
      
    );
  }
}