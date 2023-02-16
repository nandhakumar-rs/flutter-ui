import 'package:flutter/material.dart';


class Link extends StatelessWidget {
  String text = 'button';
  Function() onTap;
  
  Link({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Text(
      text,
      style: const TextStyle(
          color: Color(0xFF35C2C1),
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.w600),
    ));
  }
}
