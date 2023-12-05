import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onTap}):super(key: key);

  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Animate(
      effects: [FadeEffect(begin: 0.1,end: 1, duration: 300.ms, delay:700.ms),SlideEffect(duration: 400.ms)],
      child: Container(
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.yellow,
                  blurRadius: 5
              )
            ]
        ),
        child: ElevatedButton(onPressed: onTap ,

          style: ElevatedButton.styleFrom(
              minimumSize:  Size(width, 50),

              shape:const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
              )
          ),
          child:  Text(text,style: TextStyle(
            color: Colors.white70.withOpacity(1),
            wordSpacing: 15,
            letterSpacing: 5,

          )
          ),
        ),
      ),
    );
  }
}