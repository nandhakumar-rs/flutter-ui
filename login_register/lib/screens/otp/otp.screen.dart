import 'package:f_widgets/widgets/app_text_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/app_button.widget.dart';
import '../../widgets/link.widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

// OTP 1234

class _OtpScreenState extends State<OtpScreen> {
  final formKey = GlobalKey<FormState>();
  final FocusScopeNode _node = new FocusScopeNode();
  bool isFormValid = false;

  TextEditingController field_one = new TextEditingController();
  TextEditingController field_two = new TextEditingController();
  TextEditingController field_three = new TextEditingController();
  TextEditingController field_four = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    formKey.currentState?.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Ink(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE8ECF4), width: 2)),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  'assets/svg/back_arrow.svg',
                )),
          ),
          const SizedBox(
            height: 28,
          ),
          const Text(
            'OTP Verification',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
              'Enter the verification code we just sent on your email address.',
              style: TextStyle(
                  color: Color(0xFF838BA1),
                  fontWeight: FontWeight.w400,
                  fontSize: 16)),
          const SizedBox(
            height: 32,
          ),
          Form(
            key: formKey,
            child: FocusScope(
              node: _node,
              child: Row(
                children: [
                  AppTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return '';
                      }
                    },
                    controller: field_one,
                    type: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    onChange: (value) {
                      Clipboard.getData('text/plain').then((value) {
                        if (value?.text?.length == 4) {
                          String? pastedText = value?.text;
                          if (pastedText != null) {
                            setState(() {
                              field_one.text = pastedText[0];
                              field_two.text = pastedText[1];
                              field_three.text = pastedText[2];
                              field_four.text = pastedText[3];

                              _node.unfocus();
                            });
                          }
                        }
                        Clipboard.setData(ClipboardData(text: ''));
                      });
                      if (value.length == 1) {
                        _node.nextFocus();
                      }
                      if (value.length == 0) {
                        formKey.currentState?.reset();
                        setState(() {
                          field_one.text = '';
                          field_two.text = '';
                          field_three.text = '';
                          field_four.text = '';
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return '';
                      }
                    },
                    controller: field_two,
                    type: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    onChange: (value) {
                      if (value.length == 1) {
                        _node.nextFocus();
                      }
                      if (value.length == 0) {
                        _node.previousFocus();
                        setState(() {
                          field_two.text = '';
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return '';
                      }
                    },
                    controller: field_three,
                    type: TextInputType.number,
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    onChange: (value) {
                      if (value.length == 1) {
                        _node.nextFocus();
                      }
                      if (value.length == 0) {
                        _node.previousFocus();
                        setState(() {
                          field_three.text = '';
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    width: 17,
                  ),
                  AppTextField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return '';
                      }
                    },
                    controller: field_four,
                    type: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    onChange: (value) {
                      if (value.length == 0) {
                        _node.previousFocus();
                        setState(() {
                          field_four.text = '';
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            onChanged: () {
              setState(() {
                isFormValid = (formKey?.currentState?.validate() ?? true);
              });
            },
          ),
          const SizedBox(
            height: 30,
          ),
          AppButton(
              disabled: !isFormValid,
              variant: 'solid',
              onTap: () {
                formKey.currentState!.save();
              },
              label: 'Verify'),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Didn't received code?"),
              const SizedBox(
                width: 2,
              ),
              Link(
                onTap: () {},
                text: 'Resend',
              ),
            ],
          )
        ])),
      ),
    );
  }
}

// OTP 1234