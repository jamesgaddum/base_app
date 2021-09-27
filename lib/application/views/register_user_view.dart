import 'package:base/application/services.dart';
import 'package:base/core/user.dart';
import 'package:base/infrastructure/api_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';

class RegisterUserView extends StatefulWidget {
  const RegisterUserView({ Key? key }) : super(key: key);

  @override
  _RegisterUserViewState createState() => _RegisterUserViewState();
}

class _RegisterUserViewState extends State<RegisterUserView> {

  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                hintText: 'First Name'
              ),
            ),
            TextFormField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                hintText: 'Last Name'
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await services.get<APIService>().createUser(User(
                  id: fb_auth.FirebaseAuth.instance.currentUser!.uid,
                  firstName: _firstNameController.text,
                  lastName: _lastNameController.text,
                  dateOfBirth: DateTime.now()
                ));
              },
              child: const Text('Save')
            )
          ],
        ),
      ),
    );
  }
}