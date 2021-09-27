import 'package:base/application/widgets/onboarding_status_handler.dart';
import 'package:base/application/views/landing_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthStatusHandler extends StatelessWidget {
  const AuthStatusHandler({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        var user = snapshot.data;
        return snapshot.connectionState == ConnectionState.waiting
          ? const LandingView()
          : user == null
            ? const LandingView()
            : const OnboardingStatusHandler();
      }
    );
  }
}
