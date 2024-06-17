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