import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/intro.PNG'))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign in to continue",
                      style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey.shade700),
                    ),
                    Text(
                      'Vegi',
                      style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                                blurRadius: 15,
                                color: Colors.green.shade900,
                                offset: Offset(3, 5))
                          ]),
                    ),
                    Column(
                      children: [
                        AppleAuthButton(
                          onPressed: () {},
                          text: 'Sign up with Apple',
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GoogleAuthButton(
                          text: 'Sign up with Google',
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "By Signing In you are agreeing to our",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Text(
                          'Terms and Privacy Policy',
                          style: TextStyle(color: Colors.grey.shade700),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
