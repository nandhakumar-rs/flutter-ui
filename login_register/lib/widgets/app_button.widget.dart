import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String variant = 'solid';
  String label = 'button';

  Function() onTap;
  AppButton(
      {super.key,
      required this.variant,
      required this.onTap,
      required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            backgroundColor:
                variant == 'solid' ? Color(0xFF1E232C) : Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            side: BorderSide(color: Color(0xFF1E232C), width: 1)),
        child: Text(
          label,
          style: TextStyle(
              color: variant == 'solid' ? Colors.white : Color(0xFF1E232C)),
        ),
      ),
    );
  }
}
