import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class LoginDetail extends StatelessWidget {
  final String email;
  final String password;

  const LoginDetail({Key? key,required this.email,required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('UserName: ${email}'),
              Text('Password: ${password}'),

            ],
          ),
        ) ,

      ),
    );

  }


}



