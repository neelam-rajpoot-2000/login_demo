import 'package:flutter/material.dart';
import 'package:login_demo/vadiator.dart';

import 'login_screen.dart';
import 'signup_detail_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController comfirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                    fontSize: 45,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Enter a user name',
                  label: Text('Name'),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                maxLength: 10,
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterText: "",
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Enter a Phone Number',
                  label: Text('Phone Number'),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Enter Email-id',
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Enter Password',
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: comfirmPasswordController,
                obscureText: true,
                obscuringCharacter: "*",
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: 'Enter Confirm Password',
                  label: Text('Confirm Password'),
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member? ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: (){ Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen()));},
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty &&
                      comfirmPasswordController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      phoneNumberController.text.isNotEmpty) {
                    String? msg = ValidatorEmail.validateEmailAddress(
                        emailController.text);
                    String? pass = ValidatorPassword.validatePassword(
                        passwordController.text);
                    var phn = ValidatorPhone.validatePhone(
                        phoneNumberController.text);
                    if (nameController.text.length >= 3) {
                      if (msg == null) {
                        if (pass == null) {
                          if (phn == null) {
                            if (passwordController.text ==
                                comfirmPasswordController.text) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpDetails(
                                        name: nameController.text,
                                        phone: phoneNumberController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        confirmPassword:
                                            comfirmPasswordController.text,
                                      )));
                            } else {
                              var snackBar = const SnackBar(
                                  content: Text(
                                      'password and confirm password do not matched'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                          else {
                            var snackBar = SnackBar(content: Text(phn));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        } else {
                          var snackBar = SnackBar(content: Text(pass));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      } else {
                        var snackBar = SnackBar(content: Text(msg));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else {
                      var snackBar = const SnackBar(
                          content:
                              Text('Name should be greater then 3 character'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  } else {
                    var snackBar = const SnackBar(
                        content: Text('Please enter all details'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    // borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
