import 'package:firebase_core/firebase_core.dart';
import 'screens/chatScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/registrationScreen.dart';
import 'screens/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(apiKey: dotenv.env['FIREBASE_API_KEY']!, appId: dotenv.env['FIREBASE_APP_ID']!, messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!, projectId: dotenv.env['FIREBASE_PROJECT_ID']!),
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
