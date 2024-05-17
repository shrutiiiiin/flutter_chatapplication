import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chatapplication/screens/registrationScreen.dart';
import 'package:chatapplication/screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:chatapplication/components/roundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin
{
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate); // Changed curve
    controller.forward();
    controller.addListener(() {
      setState(() {
      });
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3642AE),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Hero(
                tag: 'main',
                child: Image(
                  image: AssetImage('assets/images/message.png'),
                  height: 200,
                  width: 250,
                ),
              ),
            ),
          ),
          Text('Flash Chat',style:TextStyle(fontSize: 42) ,
          ),
          Text(
            '${(animation.value*100).toInt()}%',
            style: TextStyle(fontSize: 34),
          ),
          SizedBox(
            height: 40,
          ),
          RoundButton(name: 'Login Here', color: Colors.blueAccent.shade200,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => loginScreen()),
              );
            },
          ),
          SizedBox(height: 40),
          RoundButton(name: 'Register', color: Colors.blueAccent.shade700,
            onPressed: (){
              Navigator.pushNamed(context, RegisterScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
