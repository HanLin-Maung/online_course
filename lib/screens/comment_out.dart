// 
// floatingActionButton: FloatingActionButton.extended(
          //   onPressed: () {
          //     Navigator.push(context,
          //         MaterialPageRoute(builder: (context) => const AddCategory()));
          //   },
          //   icon: const Icon(Icons.add),
          //   label: const Text('Add Category'),
          //   backgroundColor: const Color.fromARGB(255, 27, 34, 75),
          //   foregroundColor: Colors.white,
          // ),

// these are from featured_screen.dart.
            // Row(
            //   // mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     IconButton(
            //       onPressed: () {
            //         showDialog(
            //           context: context,
            //           builder: (BuildContext context) {
            //             return AlertDialog(
            //               title: const Text("Category Options"),
            //               content: Column(
            //                 mainAxisSize: MainAxisSize.min,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   TextButton(
            //                     onPressed: () {
            //                       Navigator.pop(
            //                           context); // Close the AlertDialog
            //                       editCategory(context,
            //                           category); // Call editCategory function
            //                     },
            //                     child: const Text('Edit'),
            //                   ),
            //                   TextButton(
            //                     onPressed: () {
            //                       showDialog(
            //                           context: context,
            //                           builder: (BuildContext context) {
            //                             return AlertDialog(
            //                               title: const Text("Delete Category"),
            //                               content: const Text(
            //                                   "Are you sure want to delete?"),
            //                               actions: <Widget>[
            //                                 Container(
            //                                   decoration: BoxDecoration(
            //                                     boxShadow: [
            //                                       BoxShadow(
            //                                         color: Colors.grey
            //                                             .withOpacity(
            //                                                 0.5), // Shadow color
            //                                         spreadRadius:
            //                                             2, // Spread radius
            //                                         blurRadius:
            //                                             4, // Blur radius
            //                                         offset: const Offset(
            //                                             0, 2), // Shadow offset
            //                                       ),
            //                                     ],
            //                                     borderRadius:
            //                                         BorderRadius.circular(
            //                                             20), // Border radius
            //                                   ),
            //                                   child: ElevatedButton(
            //                                     style: ElevatedButton.styleFrom(
            //                                       backgroundColor: Colors
            //                                           .white, // Button background color
            //                                       elevation:
            //                                           0, // No button elevation
            //                                     ),
            //                                     onPressed: () {
            //                                       Navigator.of(context)
            //                                           .pop(); // Close the dialog
            //                                     },
            //                                     child: const Text(
            //                                       "No",
            //                                       style: TextStyle(
            //                                           color: Colors
            //                                               .black), // Text color
            //                                     ),
            //                                   ),
            //                                 ),
            //                                 const SizedBox(
            //                                     width:
            //                                         10), // Add spacing between buttons
            //                                 Container(
            //                                   decoration: BoxDecoration(
            //                                     boxShadow: [
            //                                       BoxShadow(
            //                                         color: Colors.grey
            //                                             .withOpacity(
            //                                                 0.5), // Shadow color
            //                                         spreadRadius:
            //                                             2, // Spread radius
            //                                         blurRadius:
            //                                             4, // Blur radius
            //                                         offset: const Offset(
            //                                             0, 2), // Shadow offset
            //                                       ),
            //                                     ],
            //                                     borderRadius:
            //                                         BorderRadius.circular(
            //                                             20), // Border radius
            //                                   ),
            //                                   child: ElevatedButton(
            //                                     style: ElevatedButton.styleFrom(
            //                                       backgroundColor: const Color.fromRGBO(
            //                                           28,
            //                                           21,
            //                                           18,
            //                                           0.298), // Button background color
            //                                       elevation:
            //                                           0, // No button elevation
            //                                     ),
            //                                     onPressed: () {
            //                                       Navigator.of(context)
            //                                           .pop(); // Close the dialog
            //                                       deleteCategory(
            //                                           context); // Call deleteCategory function with scaffold's context
            //                                     },
            //                                     child: const Text(
            //                                       "Yes",
            //                                       style: TextStyle(
            //                                           color: Colors
            //                                               .white), // Text color
            //                                     ),
            //                                   ),
            //                                 ),
            //                               ],
            //                             );
            //                           });
            //                     },
            //                     child: const Text('Delete'),
            //                   ),
            //                 ],
            //               ),
            //             );
            //           },
            //         );
            //       },
            //       icon: const Icon(Icons.more_vert),
            //     ),
            //   ],
            // ),


  // const domain = 'https://coding-is-fun.onrender.com/api/v1';

// class API {
//   Future<List<dynamic>> getCourseList() async {
//     final prefs = await SharedPreferences.getInstance();
//     var token = prefs.getString('token');

//     try {
//       var response = await http.get(
//         Uri.parse('$domain/get-all-courses'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer $token',
//         },
//       );
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map<String, dynamic> jsonResponse = json.decode(response.body);
//         List<dynamic> courseList = jsonResponse['courses'];
//         return courseList;
//       } else {
//         throw Exception('Failed to fetch course list');
//       }
//     } catch (error) {
//       throw Exception('Error: $error');
//     }
//   }

// ,,,,,,...>>>>>>it is worked codes
// void editCategory(
//       BuildContext scaffoldContext, Map<String, dynamic> category) async {
//     try {
//       // Navigate to the EditCategoryScreen passing the category data
//       final editedCategory = await Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => EditCategoryScreen(category: category),
//         ),
//       );

//       // Check if category was edited
//       if (editedCategory != null) {
//         // Update the categoryList with the edited category
//         setState(() {
//           final index = categoryList
//               .indexWhere((element) => element['_id'] == category['_id']);
//           if (index != -1) {
//             categoryList[index] = editedCategory;
//           }
//         });

//         ScaffoldMessenger.of(scaffoldContext).showSnackBar(
//           SnackBar(content: Text('Category updated successfully')),
//         );
//       }
//     } catch (err) {
//       print('Error editing category: $err');
//       ScaffoldMessenger.of(scaffoldContext).showSnackBar(
//         SnackBar(content: Text('Failed to edit category')),
//       );
//     }
//   },,,,,......>>>>>>>>>>


// from featured screen
// onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>const CourseDetailScreen(
      //       categoryid: category["_id"],
      //     ),
      //   ),
      // ),  
      //Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailScreen(courseId: '_id',),));
      // <<<<<<<<< To Reopen >>>>>>>>



// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   late Map<String, dynamic> courseDetails = {};
//   bool isDataLoaded = false;
//   int _selectedTag = 0;

//   @override
//   void initState() {
//     super.initState();
//     _fetchCourseList();
//   }

  // Future<void> _fetchCourseList() async {
  //   try {
  //     var response = await API().getCoursesByCategoryId(widget.categoryId);
  //     setState(() {
  //       courseDetails = response.firstWhere((course) => course['title'] == widget.title, orElse: () => {});
  //       isDataLoaded = courseDetails.isNotEmpty;
  //     });
  //   } catch (error) {
  //     print('Error: $error');
  //   }
  // }

//   void changeTab(int index) {
//     setState(() {
//       _selectedTag = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             pinned: true,
//             centerTitle: true,
//             title: Text(
//               widget.title,
//               style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0),
//             ),
//             leading: IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//             ),
//             backgroundColor: Colors.white,
//             elevation: 0,
//             actions: [
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.help_outline_rounded, color: Colors.black),
//               ),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(Icons.more_vert, color: Colors.black),
//               ),
//             ],
//           ),
//           SliverToBoxAdapter(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 180,
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(24),
//                       image: DecorationImage(
//                         image: NetworkImage(widget.cover),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Text(
//                     "${widget.title} Complete Course",
//                     style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 3),
//                   const Text(
//                     "Created by MSI",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   const SizedBox(height: 3),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         const Icon(Icons.star, size: 20),
//                         const SizedBox(width: 5),
//                         const Text(
//                           '4.8',
//                           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16),
//                         ),
//                         SizedBox(width: 15),
//                         const Icon(Icons.timer, color: Colors.grey),
//                         const Text(
//                           " 60 Hours ",
//                           style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
//                         ),
//                         Spacer(),
//                         if (isDataLoaded)
//                           Text(
//                             "${courseDetails['fee']}",
//                             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
//                           )
//                         else
//                           const CircularProgressIndicator(),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   CustomTabView(index: _selectedTag, changeTab: changeTab),
//                   if (_selectedTag == 0)
//                     Expanded(child: Videos(categoryId: widget.categoryId))
//                   else if (isDataLoaded)
//                     DescriptionSection(description: courseDetails['description'] ?? 'No description available'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// class CustomTabView extends StatefulWidget {
//   final Function(int) changeTab;
//   final int index;

//   const CustomTabView({
//     Key? key,
//     required this.changeTab,
//     required this.index,
//   }) : super(key: key);

//   @override
//   State<CustomTabView> createState() => _CustomTabViewState();
// }

// class _CustomTabViewState extends State<CustomTabView> {
//   final List<String> _tags = ["Videos", "Description"];

//   Widget _buildTags(int index) {
//     return GestureDetector(
//       onTap: () {
//         widget.changeTab(index);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: MediaQuery.of(context).size.width * .135,
//           vertical: 15,
//         ),
//         decoration: BoxDecoration(
//           color: widget.index == index ? Colors.black : null,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Text(
//           _tags[index],
//           style: TextStyle(
//             color: widget.index != index ? Colors.black : Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.grey.shade200,
//       ),
//       child: Row(
//         children: _tags
//             .asMap()
//             .entries
//             .map((MapEntry map) => _buildTags(map.key))
//             .toList(),
//       ),
//     );
//   }
// }

// class Videos extends StatefulWidget {
//   final String? categoryId;

//   const Videos({Key? key, this.categoryId}) : super(key: key);

//   @override
//   _VideosState createState() => _VideosState();
// }

// class _VideosState extends State<Videos> {
//   late List<Lesson> lessonList = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchLessons();
//   }

//   Future<void> _fetchLessons() async {
//     try {
//       // Fetch lessons from API based on categoryId if provided
//       if (widget.categoryId != null) {
//         var courses = await API().getCoursesByCategoryId(widget.categoryId!);
//         for (var course in courses) {
//           var outlines = course['outlines'];
//           for (var outline in outlines) {
//             var chapters = outline['chapters'];
//             for (var chapter in chapters) {
//               setState(() {
//                 lessonList.add(Lesson(
//                   name: chapter['title'],
//                   duration:
//                       'Unknown', // You can update this if duration is provided by the API
//                   isCompleted: false,
//                   isPlaying: false,
//                 ));
//               });
//             }
//           }
//         }
//       } else {
//         // Fetch all lessons if categoryId is not provided
//         var allCourses = await API().getCourseList();
//         for (var course in allCourses) {
//           var outlines = course['outlines'];
//           for (var outline in outlines) {
//             var chapters = outline['chapters'];
//             for (var chapter in chapters) {
//               setState(() {
//                 lessonList.add(Lesson(
//                   name: chapter['title'],
//                   duration:
//                       'Unknown', // You can update this if duration is provided by the API
//                   isCompleted: false,
//                   isPlaying: false,
//                 ));
//               });
//             }
//           }
//         }
//       }
//     } catch (error) {
//       print('Error fetching lessons: $error');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: ListView.separated(
//         separatorBuilder: (_, __) {
//           return const SizedBox(
//             height: 20,
//           );
//         },
//         padding: const EdgeInsets.only(top: 20, bottom: 40),
//         shrinkWrap: true,
//         itemCount: lessonList.length,
//         itemBuilder: (_, index) {
//           return LessonCard(lesson: lessonList[index]);
//         },
//       ),
//     );
//   }
// }

// class Lesson {
//   String name;
//   String duration;
//   bool isPlaying;
//   bool isCompleted;

//   Lesson({
//     required this.duration,
//     required this.isCompleted,
//     required this.isPlaying,
//     required this.name,
//   });
// }

// class LessonCard extends StatelessWidget {
//   final Lesson lesson;
//   const LessonCard({Key? key, required this.lesson}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       decoration: BoxDecoration(
//         color: Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           lesson.isPlaying
//               ? const Icon(
//                   Icons.play_arrow_rounded,
//                   size: 24,
//                   color: Colors.black,
//                 )
//               : const Icon(
//                   Icons.queue_play_next_rounded,
//                   size: 24,
//                   color: Colors.black,
//                 ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Text(
//               lesson.name,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// these are from course detail screen . dart file
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/widgets/description_section.dart';
// import 'package:http/http.dart' as http;
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({super.key, required this.item});

//   final String item;

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   List courseOutline = [];
//   var data;
//   bool isDataLoaded = true;
//   int tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     getCourseOutline();
//   }

//   getCourseOutline() {
//     data = jsonDecode(widget.item);
//     courseOutline = data["outlines"];
//     setState(() {});
//   }

//   void addToFavorites(dynamic course) {
//     print('Course added to favorites: $course');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   pinned: true,
//                   centerTitle: true,
//                   title: Text(
//                     data["title"],
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 0,
//                     ),
//                   ),
//                   leading: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.black,
//                     ),
//                   ),
//                   backgroundColor: Colors.white,
//                   elevation: 0,
//                   actions: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.help_outline_rounded,
//                         color: Colors.black,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.more_vert,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 180,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                             image: DecorationImage(
//                               image: NetworkImage(data["cover"]),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "${data["title"]} Complete Course",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 3),
//                         Text(
//                           "Created by MSI",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         SizedBox(height: 3),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.star,
//                               size: 20,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               '4.8',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(width: 15),
//                             Icon(
//                               Icons.timer,
//                               color: Colors.grey,
//                             ),
//                             Text(
//                               " 60 Hours ",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Spacer(),
//                             isDataLoaded
//                                 ? Text(
//                                     "${courseOutline[0]['title']}",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                     ),
//                                   )
//                                 : CircularProgressIndicator(),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: CustomTabView(
//                     index: tabIndex,
//                     changeTab: (index) {
//                       setState(() {
//                         tabIndex = index;
//                       });
//                     },
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: tabIndex == 0
//                       ? OutlineList(
//                           outlines: courseOutline[0]['outlines'] ?? [],
//                         )
//                       : DescriptionSection(
//                           description: courseOutline[0]['description'] ??
//                               'No description available',
//                         ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: SizedBox(height: 60), // Add some space at the bottom
//                 ),
//               ],
//             ),
//             if (tabIndex == 0)
//               Positioned(
//                 left: 20,
//                 right: 0,
//                 bottom: 20, // Adjusted bottom value
//                 child: EnrollBottomSheet(
//                   course: courseOutline[0],
//                   addToFavorites: addToFavorites,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomTabView extends StatelessWidget {
//   final Function(int) changeTab;
//   final int index;

//   CustomTabView({Key? key, required this.changeTab, required this.index})
//       : super(key: key);

//   final List<String> _tags = ["Outlines", "Description"];

//   Widget _buildTags(BuildContext context, int tabIndex) {
//     return GestureDetector(
//       onTap: () {
//         changeTab(tabIndex);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * .16, vertical: 15),
//         decoration: BoxDecoration(
//           color: index == tabIndex ? Colors.black : null,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(
//           _tags[tabIndex],
//           style: TextStyle(
//             color: index != tabIndex ? Colors.black : Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: Colors.grey.shade200,
//       ),
//       child: Row(
//         children: List.generate(
//           _tags.length,
//           (index) => _buildTags(context, index),
//         ),
//       ),
//     );
//   }
// }

// class OutlineList extends StatelessWidget {
//   final List<dynamic> outlines;

//   OutlineList({required this.outlines});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: outlines.length,
//       itemBuilder: (context, index) {
//         var outline = outlines[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ChapterListScreen(outline: outline),
//                 ),
//               );
//             },
//             child: Card(
//               color: Colors.white,
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16),
//                 title: Text(outline['title'],
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class ChapterListScreen extends StatelessWidget {
//   final Map<String, dynamic> outline;

//   ChapterListScreen({required this.outline});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(outline['title'],
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         itemCount: outline['chapters'].length,
//         itemBuilder: (context, index) {
//           var chapter = outline['chapters'][index];
//           String? videoUrl = chapter['video'];
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//             child: InkWell(
//               onTap: () {
//                 if (videoUrl != null && videoUrl.isNotEmpty) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           VideoPlayerScreen(videoUrl: videoUrl),
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Video not available for this chapter'),
//                     ),
//                   );
//                 }
//               },
//               child: Card(
//                 color: Colors.white,
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.all(16),
//                   title: Text(chapter['title'],
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;

//   VideoPlayerScreen({required this.videoUrl});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "",
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video Player"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//       ),
//     );
//   }
// }

// class EnrollBottomSheet extends StatelessWidget {
//   final dynamic course;
//   final Function(dynamic) addToFavorites;

//   EnrollBottomSheet({required this.course, required this.addToFavorites});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     addToFavorites(course);
//                   },
//                   icon: Icon(Icons.favorite_border_outlined),
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "Add to\nfavorites",
//                 style: TextStyle(color: Colors.white),
//               )
//             ],
//           ),
//           SizedBox(width: 30),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey.shade200,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               child: Text(
//                 "ENROLL NOW",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/screens/chatpter_list_screen.dart';
// import 'package:online_course_app/screens/featured_screen.dart';
// import 'package:online_course_app/widgets/description_section.dart';
// import 'package:online_course_app/widgets/outline_list.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({super.key, required this.item});

//   final String item;

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   List courseOutline = [];
//   var data;
//   bool isDataLoaded = true;
//   int tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     getCourseOutline();
//   }

//   getCourseOutline() {
//     data = jsonDecode(widget.item);
//     courseOutline = data["outlines"];
//     setState(() {});
//   }

//   void addToFavorites(dynamic course) {
//     print('Course added to favorites: $course');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CustomScrollView(
//             slivers: [
//               SliverAppBar(
//                 pinned: true,
//                 centerTitle: true,
//                 title: Text(
//                   data["title"],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 0,
//                   ),
//                 ),
//                 leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.black,
//                   ),
//                 ),
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.help_outline_rounded,
//                       color: Colors.black,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.more_vert,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 180,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(24),
//                           image: DecorationImage(
//                             image: NetworkImage(data["cover"]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Text(
//                         "${data["title"]} Complete Course",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         "Created by MSI",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.star,
//                             size: 20,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             '4.8',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(width: 15),
//                           Icon(
//                             Icons.timer,
//                             color: Colors.grey,
//                           ),
//                           Text(
//                             " 60 Hours ",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Spacer(),
//                           isDataLoaded
//                               ? Text(
//                                 "${data['fee']}",
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 )
//                               : CircularProgressIndicator(),
//                         ],
//                       ),
//                       SizedBox(height: 20),
//                     ],
//                   ),
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: CustomTabView(
//                   index: tabIndex,
//                   changeTab: (index) {
//                     setState(() {
//                       tabIndex = index;
//                     });
//                   },
//                 ),
//               ),
//               SliverToBoxAdapter(
//                 child: tabIndex == 0
//                     ? OutlineList(
//                         outlines: courseOutline[0]['outlines'] ?? [],
//                       )
//                     : DescriptionSection(
//                         description: courseOutline[0]['description'] ??
//                             'No description available',
//                       ),
//               ),
//               SliverToBoxAdapter(
//                 child: SizedBox(height: 60), // Add some space at the bottom
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomTabView extends StatelessWidget {
//   final Function(int) changeTab;
//   final int index;

//   CustomTabView({Key? key, required this.changeTab, required this.index})
//       : super(key: key);

//   final List<String> _tags = ["Outlines", "Description"];

//   Widget _buildTags(BuildContext context, int tabIndex) {
//     return GestureDetector(
//       onTap: () {
//         changeTab(tabIndex);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * .14, vertical: 15),
//         decoration: BoxDecoration(
//           color: index == tabIndex ? Colors.black : null,
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Text(
//           _tags[tabIndex],
//           style: TextStyle(
//             color: index != tabIndex ? Colors.black : Colors.white,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25),
//         color: Colors.grey.shade200,
//       ),
//       child: Row(
//         // children: _tags
        
//         // .asMap()
//         // .entries
//         // .map((MapEntry map) => _buildTags(map.key))
//         // .toList(),
//         children: List.generate(
//           _tags.length,
//           (index) => _buildTags(context, index),
//         ),
//       ),
//     );
//   }
// }


// class OutlineList extends StatefulWidget {
//   final List outlines;

//   const OutlineList({super.key, required this.outlines});

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
//         final outline = widget.outlines[index];
//         final title = outline['title'] ?? 'No title';

//         return ListTile(
//           title: Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
            
//             ),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ChapterListScreen(outline: outline),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


// under codes are from sign up screen.dart

// bool isObscure = true; // for password show or hide

// void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  // _signup() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   final prefs = await SharedPreferences.getInstance();
  //   var response = await API().signup(
  //     _nameController.text,
  //     _emailController.text,
  //     _passwordController.text,
  //   );
  //   var res = jsonDecode(response.body);
  //   if (response.statusCode == 200) {
  //     if (res["success"] == true) {
  //       isLoading = false;
  //       await prefs.setString("token", res["accessToken"].toString());
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => FeaturedScreen(),
  //         ),
  //       );
  //     }
  //   } else if (response.statusCode == 400) {
  //     if (res["success"] == false) {
  //       var snackBar = SnackBar(content: Text('${res["message"]}'));
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     }
  //   } else {
  //     print('Failed to signup. Status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //   }
  //   setState(() {});
  // }


                                    // suffixIcon: IconButton(
                                    //       icon: Icon(_isHide
                                    //           ? Icons.visibility_off
                                    //           : Icons.visibility),
                                    //       onPressed: () {
                                    //         setState(() {
                                    //           _isHide = !_isHide;
                                    //         });
                                    //       },
                                    //     ),


// this codes are from course_screen.dart



// List courseList = [];

// class CourseScreen extends StatefulWidget {
//   const CourseScreen({super.key, required this.courses});

//   final List courses;

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen> {
//   bool showAllCourses = false;

//   // Toggle between showing all categories and showing only a subset
//   void toggleShowAllCourses() {
//     setState(() {
//       showAllCourses = !showAllCourses;
//     });
//   }

//   Future<void> fetchCourse() async {
//     try {
//       var response = await API().getCourseList();

//       if (response.statusCode == 201) {
//         var res = json.decode(response.body);
//         if (res["success"] == true) {
//           setState(() {
//             courseList = res['courses'];
//           });
//         }
//       } else {
//         throw Exception('Failed to load courses: ${response.statusCode}');
//       }
//     } catch (err) {
//       print('Error fetching categories: $err');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWideScreen = screenWidth > 600;

//     final List<Widget> courseItems = showAllCourses
//         ? widget.courses.map<Widget>((course) {
//             return _buildCourseItem(course);
//           }).toList()
//         : widget.courses.take(4).map<Widget>((course) {
//             return _buildCourseItem(course);
//           }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "All Courses",
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//             fontSize: 18,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Explore Courses",
//                       style: Theme.of(context).textTheme.bodyLarge,
//                     ),
//                     TextButton(
//                       onPressed: toggleShowAllCourses,
//                       child: Text(
//                         showAllCourses ? "Show Less" : "See All",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodyMedium
//                             ?.copyWith(color: kPrimaryColor),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               GridView.count(
//                 shrinkWrap: true,
//                 primary: false,
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 10,
//                   vertical: 10,
//                 ),
//                 crossAxisCount: isWideScreen ? 4 : 2,
//                 childAspectRatio: 0.66,
//                 crossAxisSpacing: 15,
//                 mainAxisSpacing: 15,
//                 children: courseItems,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCourseItem(Map<String, dynamic> course) {
//     // void deleteCategory(BuildContext scaffoldContext) async {
//     //   try {
//     //     var response = await API().deleteCategory(category['_id']);
//     //     if (response.statusCode == 200) {
//     //       setState(() {
//     //         categoryList
//     //             .removeWhere((element) => element['_id'] == category['_id']);
//     //       });
//     //       ScaffoldMessenger.of(scaffoldContext).showSnackBar(
//     //         SnackBar(content: Text('Category deleted successfully')),
//     //       );
//     //     } else {
//     //       throw Exception('Failed to delete category: ${response.statusCode}');
//     //     }
//     //   } catch (err) {
//     //     print('Error deleting category: $err');
//     //     ScaffoldMessenger.of(scaffoldContext).showSnackBar(
//     //       SnackBar(content: Text('Failed to delete category')),
//     //     );
//     //   }
//     // }

//     return GestureDetector(
//       onTap: () {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => const DetailsScreen(ca),
//         //   ),
//         // );
//       },
//       child: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(.1),
//               blurRadius: 4.0,
//               spreadRadius: .05,
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 // Text(truncatedTitle),
//                 IconButton(
//                     onPressed: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               title: Text("Delete Course"),
//                               content: Text("Are you sure want to delete?"),
//                               actions: <Widget>[
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey
//                                             .withOpacity(0.5), // Shadow color
//                                         spreadRadius: 2, // Spread radius
//                                         blurRadius: 4, // Blur radius
//                                         offset:
//                                             const Offset(0, 2), // Shadow offset
//                                       ),
//                                     ],
//                                     borderRadius: BorderRadius.circular(
//                                         20), // Border radius
//                                   ),
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: Colors
//                                           .white, // Button background color
//                                       elevation: 0, // No button elevation
//                                     ),
//                                     onPressed: () {
//                                       Navigator.of(context)
//                                           .pop(); // Close the dialog
//                                     },
//                                     child: const Text(
//                                       "No",
//                                       style: TextStyle(
//                                           color: Colors.black), // Text color
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                     width: 10), // Add spacing between buttons
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     boxShadow: [
//                                       BoxShadow(
//                                         color: Colors.grey
//                                             .withOpacity(0.5), // Shadow color
//                                         spreadRadius: 2, // Spread radius
//                                         blurRadius: 4, // Blur radius
//                                         offset:
//                                             const Offset(0, 2), // Shadow offset
//                                       ),
//                                     ],
//                                     borderRadius: BorderRadius.circular(
//                                         20), // Border radius
//                                   ),
//                                   child: ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       backgroundColor: const Color.fromRGBO(28, 21, 18,
//                                           0.298), // Button background color
//                                       elevation: 0, // No button elevation
//                                     ),
//                                     onPressed: () {
//                                       // Navigator.of(context)
//                                       //     .pop(); // Close the dialog
//                                       // deleteCategory(
//                                       //     context); // Call deleteCategory function with scaffold's context
//                                     },
//                                     child: const Text(
//                                       "Yes",
//                                       style: TextStyle(
//                                           color: Colors.white), // Text color
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             );
//                           });
//                     },
//                     icon: const Icon(Icons.more_vert))
//               ],
//             ),
//             // Check if cover is not null before accessing it
//             if (course["cover"] != null)
//               CachedNetworkImage(
//                 imageUrl: course["cover"]!, // URL from Api response
//                 height: kCategoryCardImageSize, //  Set the fixed size of Image
//                 width:
//                     double.infinity, // Make it flexible in horizontal direction
//                 fit: BoxFit.cover,
//               ),

//             const SizedBox(height: 6),

//             Text(course["title"]),
//             // Text(
//             //   _truncateDescription(category["description"]),
//             //   style: Theme.of(context).textTheme.bodySmall,
//             // )
//           ],  super vpn
//         ),
//       ),
//     );
//   }
// }



                            // child: Row(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Expanded(
                            //       flex: 2,
                            //       child: course['cover'] != null
                            //           ? Image.network(
                            //               course['cover'],
                            //               height: 80,
                            //               fit: BoxFit.cover,
                            //             )
                            //           : SizedBox.shrink(),
                            //     ),
                            //     SizedBox(width: 8),
                            //     Expanded(
                            //       flex: 3,
                            //       child: Column(
                            //         crossAxisAlignment: CrossAxisAlignment.start,
                            //         children: [
                            //           Text(
                            //             course['title'] ?? '',
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //           SizedBox(height: 4),
                            //           Text(
                            //             "${course['fee']}",
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                    //   children: [
                    //     // Flexible(
                    //     //   child: UserInfo(
                    //     //     onPressed: () {},
                    //     //     expanded: false,
                    //     //     title: course['teacher']['name'],
                    //     //     avatarURL: course['teacher']['avatarURL'],
                    //     //   ),
                    //     // ),
                    //     // const DotContainer(),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 2),
                    //       child: Text(course['level'], style: TextStyle(fontSize: 15, color: Colors.grey)),
                    //     ),
                    //     // const DotContainer(),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 2),
                    //       child: Text(
                    //         "${course['lessons'].length} ${course['lessons'].length > 1 ? 'Lessons' : 'Lesson'}",
                    //         style: TextStyle(fontSize: 15, color: Colors.grey),
                    //       ),
                    //     ),
                    //   ],
                    // ),


// these codes are from course_screen.dart

// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/constants/color.dart';
// import 'package:online_course_app/screens/course_detail_screen.dart';

// class CourseScreen extends StatefulWidget {
//   final String selectedCategory;

//   const CourseScreen({
//     Key? key,
//     required this.selectedCategory,
//   }) : super(key: key);

//   @override
//   State<CourseScreen> createState() => _CourseScreenState();
// }

// class _CourseScreenState extends State<CourseScreen> {
//   late List<dynamic> allCourses = [];
//   List<dynamic> displayedCourses = [];
//   bool showAllCourses = false;
//   bool isLoading = true;
//   Map<String, dynamic> selectedCategory = {};

//   @override
//   void initState() {
//     super.initState();
//     getInitData();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // Dispose any resources if needed
//   }

//   getInitData() {
//     setState(() {
//       if (widget.selectedCategory != '') {
//         selectedCategory = jsonDecode(widget.selectedCategory);
//         _fetchCourseList();
//       }
//     });
//   }

//   Future<void> _fetchCourseList() async {
//     try {
//       var response = await API().getOneCourse(selectedCategory['_id']);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         Map<String, dynamic> jsonResponse = json.decode(response.body);
//         List<dynamic> courseList = jsonResponse['courses'];
//         setState(() {
//           allCourses = courseList;
//           displayedCourses = courseList.take(5).toList(); // Show first 5 courses initially
//           isLoading = false;
//         });
//       } else {
//         print('Failed to fetch course list. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   void toggleCoursesVisibility() {
//     setState(() {
//       if (showAllCourses) {
//         displayedCourses = allCourses.take(5).toList(); // Show first 5 courses
//       } else {
//         displayedCourses = allCourses; // Show all courses
//       }
//       showAllCourses = !showAllCourses; // Toggle visibility
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         backgroundColor: Colors.black87,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           selectedCategory["title"],
//           textAlign: TextAlign.center,
//           style: Theme.of(context).appBarTheme.titleTextStyle,
//           overflow: TextOverflow.visible,
//           maxLines: null,
//         ),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Padding(
//               padding: EdgeInsets.all(5),
//               child: ListView(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey,
//                       image: DecorationImage(
//                         image: NetworkImage(selectedCategory['cover']),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Column(
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.fromLTRB(24, 16, 24, 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                   Text(
//                     "Explore Courses",
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   TextButton(
//                     onPressed: toggleCoursesVisibility,
//                     child: Text(
//                       showAllCourses ? "Show Less" : "See All",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodyMedium
//                           ?.copyWith(color: kPrimaryColor),
//                     ),
//                   )
//                 ],
//                         ),
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: EdgeInsets.symmetric(horizontal: 24),
//                         itemCount: displayedCourses.length,
//                         itemBuilder: (context, index) {
//                           var course = displayedCourses[index];
//                           return CourseItemCard(
//                             course: course,
//                             selectedCategory: selectedCategory,
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => CourseDetailScreen(
//                                     item: jsonEncode(course),
//                                     selectedCategory: jsonEncode(selectedCategory),
//                                   ),
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }

// class CourseItemCard extends StatelessWidget {
//   final Map<String, dynamic> course;
//   final Map<String, dynamic> selectedCategory;
//   final VoidCallback onPressed;

//   const CourseItemCard({
//     Key? key,
//     required this.course,
//     required this.selectedCategory,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const radius = 10.0;
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: InkWell(
//         onTap: onPressed,
//         borderRadius: BorderRadius.circular(radius),
//         child: Ink(
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(radius),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.grey[300]!,
//                 blurRadius: 3,
//               ),
//             ],
//           ),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 200.0,
//                 width: MediaQuery.of(context).size.width,
//                 child: course['cover'] != null
//                     ? ClipRRect(
//                         borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(radius),
//                         ),
//                         child: Image.network(
//                           course['cover'],
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     : const SizedBox(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(17.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       course['title'] ?? '',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 15),

//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     spreadRadius: 5,
            //     blurRadius: 7,
            //     offset: const Offset(0, 3),
            //   ),
            // ],