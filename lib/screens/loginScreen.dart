import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapplication/components/roundedButton.dart';
import 'package:chatapplication/components/constants.dart';
import 'package:flutter/material.dart';
import 'chatScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class loginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}
class _loginScreenState extends State<loginScreen> {
  bool showspinner = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3642AE),
      body: ModalProgressHUD(

        inAsyncCall: showspinner,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Hero(
                      tag: 'main',
                      child: Image(image: AssetImage('assets/images/message.png'),
                        height: 200,
                        width: 200,),
                    ),
                  )),
              SizedBox(
                height: 40,
              ),
              Text(
                'Login',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                      onChanged: (value){
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black), // Set text color
                      decoration: TextFieldDecoration.copyWith(hintText: 'Enter your email')
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                    onChanged: (value){
                      password = value;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.black), // Set text color
                    decoration: TextFieldDecoration.copyWith(hintText: 'Enter Your Password')
                ),
              ),
              SizedBox(
                height: 40,
              ),
              RoundButton(name: 'Login',
                  onPressed: () async{
                   setState(() {
                     showspinner = true;
                   });
                    try{
                      final user = _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user != null)
                      {
                        Navigator.pushNamed(context, chatScreen.id);
                      }
                      setState(() {
                        showspinner = false;
                      });
                    }
                    catch(e){

                    }

                  }, color: Colors.blueAccent.shade700.withOpacity(0.7)),
            ],
          ),
        ),
      ),
    );
  }
}
