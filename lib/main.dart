import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screen/wrapper.dart';
import 'package:hello_world/services/authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthenticationService().user,
      child: MaterialApp(
        title: 'Equity Trainer',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: TextTheme(
            headline3: TextStyle(
                fontSize: 30,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic,
                decoration: TextDecoration.none),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Wrapper(),
      ),
    );
  }
}
