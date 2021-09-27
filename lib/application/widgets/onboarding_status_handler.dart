import 'package:base/application/services.dart';
import 'package:base/application/views/home_view.dart';
import 'package:base/application/views/register_user_view.dart';
import 'package:base/application/views/waiting_view.dart';
import 'package:base/core/user.dart';
import 'package:base/infrastructure/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';

class OnboardingStatusHandler extends StatelessWidget {
  const OnboardingStatusHandler({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: services.get<APIService>().fetchUser(fb_auth.FirebaseAuth.instance.currentUser!.uid),
      builder: (context, snapshot) {
        return snapshot.connectionState == ConnectionState.waiting
          ? const WaitingView()
          : snapshot.hasData
            ? const HomeView()
            : const RegisterUserView();
      }
    );
  }
}
