// import 'dart:convert';

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/screens/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
  
//   bool isLoading = false;

// @override

//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

// Future<void> _signup() async {
//   setState(() {
//     isLoading = true;
//   });

//   try {
//     final prefs = await SharedPreferences.getInstance();
//     var response = await API().register(
//       _nameController.text,
//       _emailController.text,
//       _passwordController.text,
//     );

//     if (response.statusCode == 201) {
//       var res = jsonDecode(response.body);
//       if (res["success"] == true) {
//         await prefs.setString("token", res["accessToken"].toString());
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//       } else {
//         var snackBar = SnackBar(content: Text('${res["message"]}'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     } else if (response.statusCode == 429) {
//       var snackBar = SnackBar(content: Text('Too many requests. Please try again later.'));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     } else {
//       print('Failed to signup. Status code: ${response.statusCode}');
//       print('Response body: ${response.body}');
//     }
//   } catch (e) {
//     print('Error occurred during signup: $e');
//   }

//   setState(() {
//     isLoading = false;
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Your UI code here
//       body: SingleChildScrollView(
//         child: Container(
//           width: double.infinity,
//           height: MediaQuery.of(context).size.height,
//           decoration:  BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               colors: [
//                 Colors.blueGrey.shade900,
//                 Colors.blueGrey.shade700,
//                 Colors.blueGrey.shade400
//               ]
//             )
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               const SizedBox(height: 40,),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     FadeInUp(
//                       duration: const Duration(milliseconds: 1000),
//                       child: 
//                         const Text(
//                           'Create Your\nAccount',
//                           style: TextStyle(
//                             color: Colors.white, 
//                             fontSize: 35),
//                         ),
//                     ),
//                     const SizedBox(height: 20,),
//               FadeInUp(
//                       duration: const Duration(milliseconds: 1300), 
//                       child: const Text(
//                         "SignUp Here!",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 18,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20,),
//               Expanded(
//                 child: Container(
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(50),
//                       topRight: Radius.circular(50),
//                     ),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: Column(
//                       children: <Widget>[
                        
//                         FadeInUp(
//                           duration: const Duration(milliseconds: 1400),
//                           child: Container(
//                             child: Column(
        
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 TextField(
//                                   controller: _nameController,
//                                   decoration: const InputDecoration(
//                                     prefixIcon: Icon(Icons.person),
//                                     label: Text(
//                                       "Enter your Name",
//                                       style: TextStyle(
//                                         // fontWeight: FontWeight.w400,
//                                         color: Colors.grey,
//                                       ),
//                                     )
//                                   ),
//                                 ),
//                                 TextField(
//                                   controller: _emailController,
//                                   decoration: const InputDecoration(
//                                     prefixIcon: Icon(Icons.email),
//                                     label: Text(
//                                       " Enter your Email ",
//                                       style: TextStyle(
//                                         // fontWeight: FontWeight.w400,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
                                    
//                                   ),
//                                 ),
//                                 TextField(
//                                   controller: _passwordController,
//                                   obscureText: true, // Use obscureText for password fields
//                                   decoration: const InputDecoration(
//                                     prefixIcon: Icon(Icons.password),
//                                     label: Text(
//                                       "Password",
//                                       style: TextStyle(
//                                         // fontWeight: FontWeight.w400,
//                                         color: Colors.grey,
//                                       ),
//                                     ),
                                    
//                                   ),
//                                 ),
//                                 const TextField(
//                                   decoration: InputDecoration(
//                                     prefixIcon: Icon(Icons.password),
//                                     label: Text(
//                                       "Confirm Password",
//                                       style: TextStyle(
//                                         // fontWeight: FontWeight.w400,
//                                         color: Colors.grey,
//                                       ),
//                                     )
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           )
//                         ),
//                         const SizedBox(height: 40,),
//                         FadeInUp(
//                           duration: const Duration(milliseconds: 1500),
//                           child: MaterialButton(
//                             onPressed: () { 
//                               _signup();
//                               setState(() {
                                
//                               });
//                             },
//                             child: Container(
//                               height: 50,width: 300,
//                               decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(30),
//                               gradient: const RadialGradient(
//                                 colors: [
//                                 Color.fromARGB(255, 52, 71, 81),
//                                 Color.fromARGB(255, 30, 39, 44),
//                                 ],
//                                 radius: 0.9,
//                               ),
//                             ),
//                             child: Center(
//                               child:isLoading
//                                   ? const SpinKitRing(
//                                       color: Colors.white,
//                                       size: 30,
//                                       lineWidth: 2,
//                                     )
//                               :const Text('SIGN IN',style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                                 color: Colors.white
//                             ),
//                             ),
//                             ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 10,),
//                         FadeInUp(
//                           duration: const Duration(milliseconds: 1600),
//                           child: Align(
//                             alignment: Alignment.bottomCenter,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: <Widget>[
//                                   const Text("Already have an account? "),
//                                   TextButton(
//                                     onPressed: (){
//                                       Navigator.push(
//                                         context, 
//                                         MaterialPageRoute(
//                                           builder: (BuildContext context) =>
//                                           const LoginScreen()
//                                         )
//                                       );
//                                     }, 
//                                     child: const Text("Login",
//                                     style: TextStyle(color: Colors.blue,),
//                                     )),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                         ),
                        
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {
      final prefs = await SharedPreferences.getInstance();
      var response = await API().register(
        _nameController.text,
        _emailController.text,
        _passwordController.text,
      );

      if (response.statusCode == 201) {
        var res = jsonDecode(response.body);
        if (res["success"] == true) {
          await prefs.setString("token", res["accessToken"].toString());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          var snackBar = SnackBar(content: Text('${res["message"]}'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else if (response.statusCode == 429) {
        var snackBar = SnackBar(content: Text('Too many requests. Please try again later.'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        print('Failed to signup. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error occurred during signup: $e');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.blueGrey.shade900,
                Colors.blueGrey.shade700,
                Colors.blueGrey.shade400,
              ],
            ),
          ),
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
                        'Create Your Account',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: const Text(
                        "SignUp Here!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1400),
                          child: _buildSignUpForm(),
                        ),
                        const SizedBox(height: 40),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1500),
                          child: MaterialButton(
                            onPressed: isLoading ? null : _signup,
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
                                      'SIGN UP',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        FadeInUp(
                          duration: const Duration(milliseconds: 1600),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Already have an account? "),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) => const LoginScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Login",
                                  style: TextStyle(color: Colors.blue, fontSize: 17),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(28, 21, 18, 0.298),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildNameField(),
            _buildEmailField(),
            _buildPasswordField(),
            _buildConfirmPasswordField(),
          ],
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(
          hintText: 'Enter your Name',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.person),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildEmailField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'Enter your Email',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.email),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email address.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.password),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password.';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: TextFormField(
        obscureText: true,
        decoration: const InputDecoration(
          hintText: 'Confirm Password',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.password),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please confirm your password.';
          }
          if (value != _passwordController.text) {
            return 'Passwords do not match.';
          }
          return null;
        },
      ),
    );
  }
}



