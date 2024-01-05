import 'package:flappybird/reusable/custom_button.dart';
import 'package:flappybird/screens/co_op.dart';
import 'package:flappybird/screens/single_player.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = '/home_page';
  const HomePage({super.key});
  void singlePlayer(BuildContext context){
    Navigator.pushNamed(context, SinglePlayer.routeName);
  }
  void coopPlayer(BuildContext context){
    Navigator.pushNamed(context, Co_Op.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.brown,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomButton(text: "Single Player Mode", onTap: ()=>singlePlayer(context)),
          const SizedBox(height: 30,),
          CustomButton(text: "Co-op Mode", onTap: ()=> coopPlayer(context)),
        ],
      ),
    );
  }
}
