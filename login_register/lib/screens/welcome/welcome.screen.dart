import 'package:f_widgets/screens/login/login.screen.dart';
import 'package:f_widgets/widgets/app_button.widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/link.widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  const Spacer(),
                  const Image(image: AssetImage('assets/images/logo.png')),
                  const SizedBox(height: 40),
                  AppButton(
                      variant: 'solid',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      },
                      label: 'Login'),
                  const SizedBox(height: 16),
                  AppButton(
                      variant: 'outline',
                      onTap: () {
                        debugPrint('click');
                      },
                      label: 'Register'),
                  const SizedBox(height: 46),
                  Link(
                    onTap: () {},
                    text: 'Continue as a guest',
                  ),
                ],
              ),
            )));
  }
}
