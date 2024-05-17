import 'package:firebase_core/firebase_core.dart';
import 'screens/chatScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/registrationScreen.dart';
import 'screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: "AIzaSyD6aa5qdsHKCNslr3HDuSK8U05x5wuM5mI", appId: "1:764691951048:android:baff6cecd163dd1190a4fd", messagingSenderId: "764691951048", projectId: "chatapplication-9c23d"),
  );
  runApp( flashchat());
}


class flashchat extends StatefulWidget {
  const flashchat({super.key});

  @override
  State<flashchat> createState() => _flashchatState();
}

class _flashchatState extends State<flashchat> {
  final Future<FirebaseApp> _fApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: InitializationScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        loginScreen.id : (context)=> loginScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        chatScreen.id: (context)=> chatScreen(),
      },

    );
  }
}

class InitializationScreen extends StatefulWidget {
  @override
  _InitializationScreenState createState() => _InitializationScreenState();
}

class _InitializationScreenState extends State<InitializationScreen> {
  bool _initialized = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeFlutterFire();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      return Scaffold(
        body: Center(
          child: Text('Error initializing Firebase'),
        ),
      );
    }

    if (!_initialized) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return RegisterScreen();
  }
}
