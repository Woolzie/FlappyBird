import 'package:flappybird/screens/single_player.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:  HomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        SinglePlayer.routeName:(context)=> const SinglePlayer(),
        HomePage.routeName:(context)=> const HomePage()
      },
      initialRoute: HomePage.routeName,
    );
  }
}