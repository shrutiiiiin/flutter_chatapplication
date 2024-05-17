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
  late FirebaseAuth loggedInUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser()
  {
    final user = _auth.currentUser;
    if(user != null)
    {
      loggedInUser = user as FirebaseAuth;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Screen', style: TextStyle( fontSize: 42),),backgroundColor: Color(0xFF3642AE),),
    );
  }
}
