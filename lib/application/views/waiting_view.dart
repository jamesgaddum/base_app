import 'package:flutter/material.dart';

class WaitingView extends StatelessWidget {
  const WaitingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}