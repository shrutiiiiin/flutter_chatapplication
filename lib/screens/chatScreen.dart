import 'dart:math';

import 'package:chatapplication/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class chatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  const chatScreen({super.key});

  @override
  State<chatScreen> createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;
  late String messageText;
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
          Expanded(
            child: Container(),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Send your message here',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _firestore.collection('messages').add({
                      'text': messageText,
                      'sender': loggedInUser.email,
                    });
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}