import 'package:flappybird/screens/single_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});
  void singlePlayer(BuildContext context){
    Navigator.pushNamed(context, SinglePlayer.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
