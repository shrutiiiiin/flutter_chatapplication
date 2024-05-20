import 'package:chatapplication/components/constants.dart';
import 'package:chatapplication/components/roundedButton.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chatapplication/screens/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
class RegisterScreen extends StatefulWidget {
  static String id = 'register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showspinner = false;
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;

  @override

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
                    child: Image(
                      image: AssetImage('assets/images/message.png'),
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Text(
                'Register',
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 40),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.white),
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter your Email'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: TextFieldDecoration.copyWith(hintText: 'Enter your password'),
                ),
              ),
              SizedBox(height: 40),
              RoundButton(
                name: 'Register',
                onPressed: () async {
                  setState(() {
                    showspinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (newUser != null) {
                      Navigator.pushNamed(context, chatScreen.id);
                    }
                    setState(() {
                      showspinner = false;
                    });
                  } catch (e) {
                    print(e); // Handle error appropriately
                  }
                },
                color: Colors.blueAccent.shade700.withOpacity(0.7),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
