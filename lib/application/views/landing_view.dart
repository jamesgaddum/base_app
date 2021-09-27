import 'package:base/application/padding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LandingView extends StatelessWidget {
  const LandingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kStandardPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final googleUser = await GoogleSignIn.standard().signIn();
                      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
                      final credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth.accessToken,
                        idToken: googleAuth.idToken,
                      );
                      await FirebaseAuth.instance.signInWithCredential(credential);
                    }, 
                    child: const Text('Sign in with Google')
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}