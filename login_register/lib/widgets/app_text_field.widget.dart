import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  String? placeholder = 'button';
  final TextEditingController? controller;
  TextInputType type = TextInputType.text;
  TextAlign textAlign = TextAlign.left;
  bool obscureText = false;
  int maxLength = 100;
  FocusNode? focusNode = null;
  Function(dynamic)? onChange;
  Function(dynamic)? onSave;
  String? Function(String?)? validator;

  AppTextField(
      {super.key,
      this.placeholder,
      this.controller,
      this.validator,
      required this.type,
      this.obscureText = false,
      this.maxLength = 100,
      this.textAlign = TextAlign.left,
      this.onChange,
      this.onSave,
      this.focusNode});

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool hasValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller?.addListener(() {
      setState(() {
        hasValue = widget.controller?.text.toString().isNotEmpty ?? true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
            decoration: BoxDecoration(
                color: !hasValue
                    ? const Color(0xFFF7F8F9)
                    : const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color:
                        !hasValue ? const Color(0xFFE8ECF4) : Color(0xFF35C2C1),
                    width: 1)),
            child: TextFormField(
              validator: widget.validator,
              controller: widget.controller,
              textAlign: widget.textAlign,
              maxLength: widget.maxLength,
              keyboardType: widget.type,
              obscureText: widget.obscureText,
              autocorrect: !widget.obscureText,
              onChanged: (value) {
                widget.onChange?.call(value);
              },
              onSaved: (value) {
                widget.onSave?.call(value);
              },
              style: TextStyle(fontSize: 16),
              decoration: InputDecoration(
                  errorText: null,
                  errorStyle: TextStyle(height: 0, fontSize: 0),
                  counterText: '',
                  contentPadding: EdgeInsets.all(18),
                  border: InputBorder.none,
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(color: const Color(0xFF8391A1))),
            )));
  }
}


// 1234