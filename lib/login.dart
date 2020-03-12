import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:conn3ct/chat.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';

// import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginPage> {
  bool isSignIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser _user;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();
  // @override
  // void initStste() {
  //   super.initState();
  //   isSignIn = false;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body:
            // isSignIn
            // ? Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) {
            //       return ChatPage();
            //     }),
            //   )
            // :
            Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Expanded(
            //   child: Center(
            //     child: Text(
            //       "Sign In",
            //       style: TextStyle(
            //         fontSize: 60,
            //         fontFamily: 'Pacifico',
            //         color: Colors.lightBlueAccent,
            //       ),
            //     ),
            //   ),
            // ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        icon: Image.asset('images/icons8-google-150.png'),
                        iconSize: 100,
                        onPressed: () {
                          _googleSignUp();
                        }),
                    IconButton(
                      icon: Image.asset('images/icons8-facebook-150.png'),
                      iconSize: 100,
                      onPressed: () {
                        // signUpWithFacebook();
                      },
                      // ),
                    )
                  ],
                ),
              ),
            ),
            // Expanded(
            //   child: Center(
            //     child: Text(
            //       "conn3ct",
            //       style: TextStyle(
            //         fontSize: 40,
            //         fontFamily: 'Pacifico',
            //         color: Colors.lightBlueAccent,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        )));
  }

  Future<void> _googleSignUp() async {
    try {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      AuthResult _result = (await _auth.signInWithCredential(credential));
      _user = _result.user;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return ChatPage();
        }),
      );
      // print(_user.displayName);
    } catch (e) {
      print(e.message);
    }
  }
}
