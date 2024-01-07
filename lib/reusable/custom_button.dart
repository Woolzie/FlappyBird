import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onTap}):super(key: key);

  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return   Container(
        child: Center(
          child: ElevatedButton(onPressed: onTap ,
            style: ElevatedButton.styleFrom(
                minimumSize:  Size(width*0.7, 50),
                backgroundColor: Colors.brown[800],
                side: const BorderSide(
                  color: Colors.yellow,
                  width: 3.0,
                ),
                shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                )
            ),
            child:  Text(text,style: TextStyle(
              color: Colors.yellow[200]?.withOpacity(1),
              wordSpacing: 15,
              letterSpacing: 5,

            )
            ),
          ),
        ),
      );
  }
}