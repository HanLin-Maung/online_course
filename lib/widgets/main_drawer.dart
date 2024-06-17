// import 'package:flutter/material.dart';
// import 'package:online_course_app/screens/course_screen.dart';
// import 'package:online_course_app/screens/featured_screen.dart';
// import 'package:online_course_app/screens/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class MainDrawer extends StatefulWidget {
//   const MainDrawer({super.key});

//   @override
//   State<MainDrawer> createState() => _MainDrawerState();
// }

// class _MainDrawerState extends State<MainDrawer> {

//   Future<void> _logout(BuildContext context) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.remove('auth_token');

//     // Navigate to the login screen after logging out
//     // ignore: use_build_context_synchronously
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(builder: (context) => const LoginScreen()),
//       (Route<dynamic> route) => false, // Clear all routes from the stack
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           const DrawerHeader(
            
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 bottomLeft: Radius.circular(15),
//                 bottomRight: Radius.circular(15),
//               ),
//               gradient: RadialGradient(
//                 colors: [
//                   Color.fromARGB(255, 52, 71, 81),
//                   Color.fromARGB(255, 30, 39, 44),
//                 ],
//                 radius: 0.9,
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey,
//                   spreadRadius: 4,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.cast_for_education,
//                   size: 48,
//                   color: Colors.yellowAccent,
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'MSI App',
//                   style: TextStyle(fontSize: 23, color: Colors.white,fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             leading: const Icon(Icons.category, size: 26,color: Colors.blueAccent,),
//             title: const Text('Categories'),
//             onTap: () {
//               // Handle tapping on categories item
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const FeaturedScreen()));
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.category, size: 26, color: Colors.greenAccent,),
//             title: const Text('All Courses'),
//             onTap: () {
//               Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const CourseScreen(title: 'title', cover: '', ),));}),
//               // Handle tapping on categories item
          
//           ListTile(
//             leading:const Icon(Icons.logout, size: 26, color: Colors.blueGrey,),
//             title: const Text('Logout'),
//             onTap: () {
//               _showLogoutDialog(context); // Call the function to show logout dialog
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _showLogoutDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text(
//           "Are you sure you want to exit?", 
//           style: TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//           ),),
//         actions: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5), // Shadow color
//                   spreadRadius: 2, // Spread radius
//                   blurRadius: 4, // Blur radius
//                   offset: Offset(0, 2), // Shadow offset
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(20), // Border radius
//             ),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 iconColor: Colors.white, // Button background color // change primary to iconColor
//                 elevation: 0, // No button elevation
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child:const Text(
//                 "No",
//                 style: TextStyle(color: Colors.black), // Text color
//               ),
//             ),
//           ),
//           const SizedBox(width: 10), // Add spacing between buttons
//           Container(
//             decoration: BoxDecoration(
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5), // Shadow color
//                   spreadRadius: 2, // Spread radius
//                   blurRadius: 4, // Blur radius
//                   offset: Offset(0, 2), // Shadow offset
//                 ),
//               ],
//               borderRadius: BorderRadius.circular(20), // Border radius
//             ),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromRGBO(28, 21, 18, 0.298),// Button background color
//                 elevation: 0, // No button elevation
//               ),
//               onPressed: () {
//                 _logout(context); // Logout action
//               },
//               child:const Text(
//                 "Yes",
//                 style: TextStyle(color: Colors.white), // Text color
//               ),
//             ),
//           ),
//         ],
//       );
//     },
//   );
// }
// }