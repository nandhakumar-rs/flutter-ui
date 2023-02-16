import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String variant = 'solid';
  String label = 'button';
  bool disabled = false;

  Function() onTap;
  AppButton(
      {super.key,
      required this.variant,
      required this.onTap,
      required this.label,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: disabled ? null : onTap,
        style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            disabledBackgroundColor: Color.fromARGB(255, 150, 150, 150),
            backgroundColor:
                variant == 'solid' ? Color(0xFF1E232C) : Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            side:
                BorderSide(color: Color(0xFF1E232C), width: disabled ? 0 : 1)),
        child: Text(
          label,
          style: TextStyle(
              color: variant == 'solid' ? Colors.white : Color(0xFF1E232C)),
        ),
      ),
    );
  }
}
