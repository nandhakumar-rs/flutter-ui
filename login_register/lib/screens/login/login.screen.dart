import 'package:f_widgets/widgets/link.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/app_button.widget.dart';
import '../../widgets/app_text_field.widget.dart';
import '../otp/otp.screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            'Welcome back! Glad to see you, Again!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(
            height: 32,
          ),
          AppTextField(
            placeholder: 'Enter Your Email',
            type: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 14,
          ),
          AppTextField(
            placeholder: 'Enter Your Password',
            type: TextInputType.text,
            obscureText: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: const Color(0xFF6A707C)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          AppButton(
              variant: 'solid',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OtpScreen()));
              },
              label: 'Login'),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 1,
                width: 112,
                decoration: BoxDecoration(color: const Color(0xFFE8ECF4)),
              ),
              Text('Or Login with',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF6A707C))),
              Container(
                height: 1,
                width: 112,
                decoration: BoxDecoration(color: const Color(0xFFE8ECF4)),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xFFE8ECF4), width: 1)),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/svg/google.svg',
                    )),
              ),
              Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xFFE8ECF4), width: 1)),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/svg/facebook.svg',
                    )),
              ),
              Ink(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(color: const Color(0xFFE8ECF4), width: 1)),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/svg/apple.svg',
                    )),
              )
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't Have an Account?"),
              const SizedBox(
                width: 2,
              ),
              Link(
                onTap: () {},
                text: 'Register Now',
              )
            ],
          )
        ])),
      ),
    );
  }
}
