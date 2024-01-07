import 'package:flappybird/screens/co_op.dart';
import 'package:flappybird/screens/single_player.dart';
import 'package:flutter/material.dart';
import 'package:flappybird/screens/home.dart';
import 'package:bonfire/bonfire.dart';
import 'package:flame/flame.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);// to have widgets other than Myapp run first too
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomePage(), //supposed to be HomePage()
      debugShowCheckedModeBanner: false,
      routes: {
        SinglePlayer.routeName:(context)=> const SinglePlayer(),
        HomePage.routeName:(context)=> const HomePage(),
        Co_Op.routeName:(context)=> const Co_Op()
      },
      initialRoute: HomePage.routeName, // change it to Homepage
    );
  }
}