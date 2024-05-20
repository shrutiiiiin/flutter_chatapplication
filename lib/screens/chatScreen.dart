import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class chatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      loggedInUser = user ;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Screen',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Color(0xFF3642AE),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          ),
        ],
      ),
      body: Column(

        children: [

          Center(child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Text('Here you text will appear'),
          )),
        ],
      ),
    );
  }
}
