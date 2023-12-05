import 'package:flutter/material.dart';

//single player button, opens to a page
class SinglePlayer extends StatefulWidget {
  static String routeName= '/single-player';
  const SinglePlayer({super.key});

  @override
  State<SinglePlayer> createState() => _SinglePlayerState();
}

class _SinglePlayerState extends State<SinglePlayer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Text("gay")
        );
  }
}

