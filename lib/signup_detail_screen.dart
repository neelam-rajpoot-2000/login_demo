import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignUpDetails extends StatelessWidget {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpDetails({Key? key,required this.name,required this.phone,required this.email,required this.password,required this.confirmPassword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(

       children: [
         Text('UserName: ${name}'),
         Text('Phone Number: ${phone}'),
         Text('Email-Id: ${email}'),
         Text('Password: ${password}'),
         Text('Confirm Password: ${confirmPassword}'),
       ],
          ),

    ));
  }
}
