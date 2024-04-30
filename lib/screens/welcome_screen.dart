import 'package:flutter/material.dart';
import 'package:online_course_app/screens/login_screen.dart';
import 'package:online_course_app/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 52, 71, 81),
                      Color.fromARGB(255, 30, 39, 44),
                    ],
                  ),
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(70)),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/msi.png",
                    scale: 0.8,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.666,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 52, 71, 81),
                    Color.fromARGB(255, 30, 39, 44),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.666,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                  )),
              child: Column(
                children: [
                  Text(
                    "MSI Programming",
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        wordSpacing: 2),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Container(
                      height: 53,
                      width: 320,
                      decoration: BoxDecoration(
                        color:const Color.fromARGB(255, 60, 76, 84),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Color.fromRGBO(70, 60, 55, 0.282),),
                      ),
                      child: const Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              ),
                              
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpScreen()));
                    },
                    child: Container(
                      height: 53,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          'SIGN UP',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),

      ),
    );
  }
}



        // child: Column(children: [
        //   const Padding(
        //     padding: EdgeInsets.only(top: 100.0),
        //     child: Image(
        //       image: AssetImage(
        //         'assets/images/msilogo.png',

        //         // ImageInput(
        //         //   onPickImage: (image) {
        //         //     _selectedImage = image;
        //         //   },
        //         // ),
        //       ),
        //     ),
        //   ),
        //   const SizedBox(
        //     height: 100,
        //   ),
        //   const Text(
        //     'CodingIS Fun',
        //     style: TextStyle(fontSize: 30, color: Colors.white),
        //   ),
        //   const SizedBox(
        //     height: 30,
        //   ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(context,
        //         MaterialPageRoute(builder: (context) => const LoginScreen()));
        //   },
        //   child: Container(
        //     height: 53,
        //     width: 320,
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(color: Colors.white),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         'LOGIN',
        //         style: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
        // const SizedBox(
        //   height: 30,
        // ),
        // GestureDetector(
        //   onTap: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => const SignUpScreen()));
        //   },
        //   child: Container(
        //     height: 53,
        //     width: 320,
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(30),
        //       border: Border.all(color: Colors.white),
        //     ),
        //     child: const Center(
        //       child: Text(
        //         'SIGN UP',
        //         style: TextStyle(
        //             fontSize: 20,
        //             fontWeight: FontWeight.bold,
        //             color: Colors.black),
        //       ),
        //     ),
        //   ),
        // ),
        // ]),