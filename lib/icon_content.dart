import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconContent({required this.cardIcon, this.cardText});
  final IconData ?cardIcon;
  final String ?cardText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(cardIcon,
          size: 70.0,),
        SizedBox(
          height: 15.0,
        ),
        Text(cardText!,
          style: TextStyle(
            color: Color(0xFF8D8E98),
            fontSize:15.0 ,
          ),)
      ],
    );
  }
}