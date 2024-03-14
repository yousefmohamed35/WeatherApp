import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text ,
      style:const TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
