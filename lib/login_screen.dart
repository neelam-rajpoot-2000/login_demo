import 'package:flutter/material.dart';
import 'package:login_demo/vadiator.dart';

import 'login_detail_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(size: 60),
                Text(
                  "Flutter",
                  style: TextStyle(
                      fontSize: 47,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: password,
              obscureText: true,
              obscuringCharacter: "*",
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Forward Password', style: TextStyle(fontSize: 18)),
            ),
            InkWell(
              onTap: () {
                if (email.text.isNotEmpty && password.text.isNotEmpty) {
                  String? msg = ValidatorEmail.validateEmailAddress(email.text);
                  if (msg != null) {
                    var snackBar = const SnackBar(
                        content: Text('Please enter a valid email address'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginDetail(
                          email: email.text,
                          password: password.text,
                        ),
                      ),
                    );
                  }
                } else {
                  var snackBar = const SnackBar(
                      content: Text('Please enter username & password'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Spacer(),
            Text('New User? Create Account')
          ],
        ),
      ),
    ));
  }
}
