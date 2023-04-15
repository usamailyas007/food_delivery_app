import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/home/home_screen.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  SignInWithGoogle() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential user =
      await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){

    }
  }

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
                height: 500,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
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
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          height: 45,
                          width: 270,
                          child: AppleAuthButton(
                            onPressed: () {},
                            text: 'Sign up with Apple',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 270,
                          height: 45,
                          child: GoogleAuthButton(
                            text: 'Sign up with Google',
                            onPressed: () {
                              SignInWithGoogle().then((value) =>
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  )));
                            },
                          ),
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
