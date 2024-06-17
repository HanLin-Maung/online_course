// this screen is copy from gpt to split course_detail_screen
// import 'package:flutter/material.dart';
// import 'package:online_course_app/screens/chatpter_list_screen.dart';


// class OutlineList extends StatefulWidget {
//   final List outlines;

//   const OutlineList({super.key,required this.outlines});

//   @override
//   State<OutlineList> createState() => _OutlineListState();
// }

// class _OutlineListState extends State<OutlineList> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: widget.outlines.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(widget.outlines[index]['title']),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ChapterListScreen(outline: widget.outlines[index]),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
