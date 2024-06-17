import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/screens/featured_screen.dart';
import 'package:online_course_app/screens/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  bool _isHidden = true;

  _login() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    var response = await API().login(
      _emailController.text,
      _passwordController.text,
    );
    var res = jsonDecode(response.body);
    if (response.statusCode == 200) {
      if (res["success"] == true) {
        isLoading = false;
        await prefs.setString("token", res["accessToken"].toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FeaturedScreen(),
          ),
        );
      }
    } else if (response.statusCode == 400) {
      print(">>>>>>>>> response");
      if (res["success"] == false) {
        print(">>>>>>>>> response 2");
        var snackBar = SnackBar(content: Text('${res["message"]}'));
        // Step 3
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        print(">>>>>>>>> response 3");
      }
    } else {
      // print('failed');
      print('Failed to login. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blueGrey.shade900,
          Colors.blueGrey.shade700,
          Colors.blueGrey.shade400,
        ])),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).padding.top + 20),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: const Text(
                        "Coding is fun",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        "Please, Login to continue...",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 60,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1400),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(28, 21, 18, 0.298),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: SingleChildScrollView(
                            child: Form(
                              // key: _form,    // kana out
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200),
                                      ),
                                    ),
                                    child:  TextField(
                                      controller: _emailController,  
                                      obscureText: false,
                                      decoration: const InputDecoration(
                                        hintText: 'Email',
                                        hintStyle:
                                            TextStyle(color: Colors.grey),
                                        border: InputBorder.none,
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      autocorrect: false,
                                      textCapitalization:
                                          TextCapitalization.none,
                                      // validator: (value) {
                                      //   if (value == null || value.isEmpty) {
                                      //     return "Please enter your email address.";
                                      //   }
                                      //   return null;
                                      // },
                                      // onSaved: () {

                                      // }
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                            color: Colors.grey.shade200),
                                      ),
                                    ),
                                    child: TextField(
                                      controller: _passwordController,
                                      obscureText: _isHidden,
                                      decoration: InputDecoration(
                                          hintText: 'Password',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.password),
                                          suffixIcon: IconButton(
                                            icon: Icon(_isHidden
                                                ? Icons.visibility_off
                                                : Icons.visibility),
                                            onPressed: () {
                                              setState(() {
                                                _isHidden = !_isHidden;
                                              });
                                            },
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: MaterialButton(
                            onPressed: () {
                              _login();
                              setState(() {});
                            },
                            height: 50,
                            color: Colors.blueGrey[800],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: isLoading
                                  ? const SpinKitRing(
                                      color: Colors.white,
                                      size: 30,
                                      lineWidth: 2,
                                    )
                                  : const Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      FadeInUp(
                        duration: const Duration(milliseconds: 1700),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen()));
                                },
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 17),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
