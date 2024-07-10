// import 'dart:convert';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_course_app/Api/api.dart';
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
//           displayedCourses =
//               courseList.take(5).toList(); // Show first 5 courses initially
//           isLoading = false;
//         });
//       } else {
//         print(
//             'Failed to fetch course list. Status code: ${response.statusCode}');
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
//         backgroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           selectedCategory["title"],
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//           ),
//           overflow: TextOverflow.visible,
//           maxLines: null,
//         ),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     image: DecorationImage(
//                       image: NetworkImage(selectedCategory['cover']),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             "Courses",
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: toggleCoursesVisibility,
//                             child:
//                                 Text(showAllCourses ? "See less" : "See all"),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ListView.separated(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       itemCount: displayedCourses.length,
//                       separatorBuilder: (context, index) => Divider(height: 32),
//                       itemBuilder: (context, index) {
//                         var course = displayedCourses[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CourseDetailScreen(
//                                   item: jsonEncode(course),
//                                   selectedCategory:
//                                       jsonEncode(selectedCategory),
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 211, 216,
//                                   218), // Set a different background color
//                               borderRadius:
//                                   BorderRadius.circular(10), // Rounded corners
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 2,
//                                   blurRadius: 5,
//                                   offset: Offset(
//                                       0, 3), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             padding: EdgeInsets.all(
//                                 8), // Add some padding inside the container
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   flex: 2,
//                                   child: ClipRRect(
//                                     borderRadius: BorderRadius.circular(
//                                         10), // Rounded corners for the image
//                                     child: course['cover'] != null
//                                         ? Image.network(
//                                             course['cover'],
//                                             height: 80,
//                                             fit: BoxFit.cover,
//                                           )
//                                         : SizedBox.shrink(),
//                                   ),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Expanded(
//                                   flex: 3,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         course['title'] ?? '',
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 4,
//                                         height: 4,
//                                       ),
//                                       Text(
//                                         "Fee:${course['fee']}",
//                                         style: TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//     );
//   }
// }

// with Tap Bar 
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/constants/color.dart';
import 'package:online_course_app/screens/course_detail_screen.dart';

class CourseScreen extends StatefulWidget {
  final String selectedCategory;

  const CourseScreen({
    Key? key,
    required this.selectedCategory,
  }) : super(key: key);

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  late List<dynamic> allCourses = [];
  List<dynamic> displayedCourses = [];
  bool showAllCourses = false;
  bool isLoading = true;
  Map<String, dynamic> selectedCategory = {};

  @override
  void initState() {
    super.initState();
    getInitData();
  }

  getInitData() {
    setState(() {
      if (widget.selectedCategory != '') {
        selectedCategory = jsonDecode(widget.selectedCategory);
        _fetchCourseList();
      }
    });
  }

  Future<void> _fetchCourseList() async {
    try {
      var response = await API().getOneCourse(selectedCategory['_id']);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> courseList = jsonResponse['courses'];
        setState(() {
          allCourses = courseList;
          displayedCourses = courseList.take(5).toList(); // Show first 5 courses initially
          isLoading = false;
        });
      } else {
        print('Failed to fetch course list. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void toggleCoursesVisibility() {
    setState(() {
      if (showAllCourses) {
        displayedCourses = allCourses.take(5).toList(); // Show first 5 courses
      } else {
        displayedCourses = allCourses; // Show all courses
      }
      showAllCourses = !showAllCourses; // Toggle visibility
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          
          foregroundColor: Colors.white,
          backgroundColor: Colors.blueGrey[800],
          elevation: 0,
          centerTitle: true,
          title: Text(
            selectedCategory["title"],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.visible,
            maxLines: null,
          ),
          bottom: const TabBar(
            labelColor: Colors.yellowAccent,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.yellow,
            tabs: [
              Tab(text: "All Courses"),
              Tab(text: "About Category"),
            ],
          ),
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(selectedCategory['cover']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // const SizedBox(height: 5),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildCourseList(),
                        _buildCategoryDetail(),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildCourseList() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Explore Courses",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextButton(
                onPressed: toggleCoursesVisibility,
                child: Text(showAllCourses ? "See less" : "See all",
                  style: Theme.of(context).textTheme.bodyMedium ?.copyWith(color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemCount: displayedCourses.length,
            separatorBuilder: (context, index) => Divider(height: 32),
            itemBuilder: (context, index) {
              var course = displayedCourses[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDetailScreen(
                        item: jsonEncode(course),
                        selectedCategory: jsonEncode(selectedCategory),
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 211, 216, 218),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: course['cover'] != null
                              ? Image.network(
                                  course['cover'],
                                  height: 80,
                                  fit: BoxFit.cover,
                                )
                              : SizedBox.shrink(),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course['title'] ?? '',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              width: 4,
                              height: 4,
                            ),
                            Text(
                              "Fee: ${course['fee']}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryDetail() {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 218, 215, 215),
        
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Padding(
              //   padding: EdgeInsets.only(left: 80),),
              Text(
                selectedCategory["title"],
                style: Theme.of(context).textTheme.headlineMedium,
                
              ),
              const SizedBox(height: 20),
              Text(
                "Description",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 5),
              Text(
                selectedCategory["description"] ?? "No description available.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// 'course' and 'see all' contain in Tab 2
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_course_app/Api/api.dart';
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
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           foregroundColor: Colors.white,
//           backgroundColor: Color.fromARGB(255, 60, 76, 84),
//           elevation: 0,
//           centerTitle: true,
//           title: Text(
//             selectedCategory["title"],
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               letterSpacing: 1,
//             ),
//             overflow: TextOverflow.visible,
//             maxLines: null,
//           ),
//           bottom: const TabBar(
//             labelColor: Colors.white,
//             unselectedLabelColor: Colors.yellowAccent,
//             indicatorColor: Colors.white,
//             tabs: [
//               Tab(text: "All Courses"),
//               Tab(text: "Tab 2"),
//             ],
//           ),
//         ),
//         body: isLoading
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : Column(
//                 children: [
//                   Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: 200,
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: NetworkImage(selectedCategory['cover']),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(24, 16, 24, 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           "Courses",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: toggleCoursesVisibility,
//                           child: Text(showAllCourses ? "See less" : "See all"),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Expanded(
//                     child: TabBarView(
//                       children: [
//                         _buildCourseList(),
//                         _buildCategoryDetail(),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }

//   Widget _buildCourseList() {
//     return ListView.separated(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       itemCount: displayedCourses.length,
//       separatorBuilder: (context, index) => Divider(height: 32),
//       itemBuilder: (context, index) {
//         var course = displayedCourses[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CourseDetailScreen(
//                   item: jsonEncode(course),
//                   selectedCategory: jsonEncode(selectedCategory),
//                 ),
//               ),
//             );
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 211, 216, 218),
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             padding: EdgeInsets.all(8),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: course['cover'] != null
//                         ? Image.network(
//                             course['cover'],
//                             height: 80,
//                             fit: BoxFit.cover,
//                           )
//                         : SizedBox.shrink(),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         course['title'] ?? '',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 4,
//                         height: 4,
//                       ),
//                       Text(
//                         "Fee: ${course['fee']}",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildCategoryDetail() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               selectedCategory["title"],
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Description",
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 5),
//             Text(
//               selectedCategory["description"] ?? "No description available.",
//               style: TextStyle(
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// LateInitializationError: Field '_tabController@52508329' has not been initialized.
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:online_course_app/Api/api.dart';
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

// class _CourseScreenState extends State<CourseScreen> with SingleTickerProviderStateMixin {
//   late List<dynamic> allCourses = [];
//   List<dynamic> displayedCourses = [];
//   bool showAllCourses = false;
//   bool isLoading = true;
//   Map<String, dynamic> selectedCategory = {};
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     getInitData();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
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
//         backgroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           selectedCategory["title"],
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             letterSpacing: 1,
//           ),
//           overflow: TextOverflow.visible,
//           maxLines: null,
//         ),
//       ),
//       body: isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Column(
//               children: [
//                 Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.grey,
//                     image: DecorationImage(
//                       image: NetworkImage(selectedCategory['cover']),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 15),
//                 TabBar(
//                   controller: _tabController,
//                   labelColor: Colors.black,
//                   indicatorColor: Colors.black,
//                   tabs: [
//                     Tab(text: "Tab 1"),
//                     Tab(text: "Tab 2"),
//                     Tab(text: "Tab 3"),
//                   ],
//                 ),
//                 Expanded(
//                   child: TabBarView(
//                     controller: _tabController,
//                     children: [
//                       _buildCourseList(),
//                       Center(child: Text("Content for Tab 2")),
//                       Center(child: Text("Content for Tab 3")),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }

//   Widget _buildCourseList() {
//     return ListView.separated(
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       itemCount: displayedCourses.length,
//       separatorBuilder: (context, index) => Divider(height: 32),
//       itemBuilder: (context, index) {
//         var course = displayedCourses[index];
//         return GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CourseDetailScreen(
//                   item: jsonEncode(course),
//                   selectedCategory: jsonEncode(selectedCategory),
//                 ),
//               ),
//             );
//           },
//           child: Container(
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 211, 216, 218),
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             padding: EdgeInsets.all(8),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: course['cover'] != null
//                         ? Image.network(
//                             course['cover'],
//                             height: 80,
//                             fit: BoxFit.cover,
//                           )
//                         : SizedBox.shrink(),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         course['title'] ?? '',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 4,
//                         height: 4,
//                       ),
//                       Text(
//                         "Fee: ${course['fee']}",
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/constants/color.dart';
// import 'package:online_course_app/constants/size.dart';
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
//           displayedCourses = courseList.take(6).toList();
//           isLoading = false;
//         });
//       } else {
//         print(
//             'Failed to fetch course list. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error: $error');
//     }
//   }

//   void toggleCoursesVisibility() {
//     setState(() {
//       if (showAllCourses) {
//         displayedCourses = allCourses.take(6).toList();
//       } else {
//         displayedCourses = allCourses;
//       }
//       showAllCourses = !showAllCourses;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isWideScreen = screenWidth > 600;

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
//           : Column(
//               children: [
//                 // Container(
//                 //   width: MediaQuery.of(context).size.width,
//                 //   height: 200,
//                 //   decoration: BoxDecoration(
//                 //     // borderRadius: BorderRadius.circular(20),
//                 //     color: Colors.grey,
//                 //     image: DecorationImage(
//                 //       image: NetworkImage(selectedCategory['cover']),
//                 //       fit: BoxFit.cover,
//                 //     ),
//                 //   ),
//                 // ),
//                 // const SizedBox(height: 15),
//                 Padding(
//                   padding: EdgeInsets.fromLTRB(5, 0, 5, 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Explore Courses",
//                         style: Theme.of(context).textTheme.bodyLarge,
//                       ),
//                       TextButton(
//                         onPressed: toggleCoursesVisibility,
//                         child: Text(
//                           showAllCourses ? "Show Less" : "See All",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodyMedium
//                               ?.copyWith(color: kPrimaryColor),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 10, vertical: 10),
//                     child: GridView.count(
//                       crossAxisCount: isWideScreen ? 4 : 2,
//                       childAspectRatio: 0.85,
//                       crossAxisSpacing: 15,
//                       mainAxisSpacing: 15,
//                       children: displayedCourses.map((course) {
//                         return CourseItemCard(
//                           course: course,
//                           selectedCategory: selectedCategory,
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => CourseDetailScreen(
//                                   item: jsonEncode(course),
//                                   selectedCategory:
//                                       jsonEncode(selectedCategory),
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                 ),
//               ],
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
//       padding: const EdgeInsets.only(bottom: 10),
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
//                           height: kCategoryCardImageSize,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     : const SizedBox(
//                         height: 6,
//                       ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       course['title'] ?? '',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     // const SizedBox(height: 15),
//                     Text(
//                       course['description'] ?? '',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style:const TextStyle(
//                         fontSize: 14,
//                       ),
//                     ),
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