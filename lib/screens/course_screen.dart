import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/constants/color.dart';
import 'package:online_course_app/constants/size.dart';

List courseList = [];

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key, required this.courses});

  final List courses;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool showAllCourses = false;

  // Toggle between showing all categories and showing only a subset
  void toggleShowAllCourses() {
    setState(() {
      showAllCourses = !showAllCourses;
    });
  }

  Future<void> fetchCourse() async {
    try {
      var response = await API().getCourseList();

      if (response.statusCode == 201) {
        var res = json.decode(response.body);
        if (res["success"] == true) {
          setState(() {
            courseList = res['courses'];
          });
        }
      } else {
        throw Exception('Failed to load courses: ${response.statusCode}');
      }
    } catch (err) {
      print('Error fetching categories: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    final List<Widget> courseItems = showAllCourses
        ? widget.courses.map<Widget>((course) {
            return _buildCourseItem(course);
          }).toList()
        : widget.courses.take(4).map<Widget>((course) {
            return _buildCourseItem(course);
          }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Courses",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Explore Courses",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: toggleShowAllCourses,
                      child: Text(
                        showAllCourses ? "Show Less" : "See All",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: kPrimaryColor),
                      ),
                    )
                  ],
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                crossAxisCount: isWideScreen ? 4 : 2,
                childAspectRatio: 0.66,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: courseItems,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCourseItem(Map<String, dynamic> course) {
    // void deleteCategory(BuildContext scaffoldContext) async {
    //   try {
    //     var response = await API().deleteCategory(category['_id']);
    //     if (response.statusCode == 200) {
    //       setState(() {
    //         categoryList
    //             .removeWhere((element) => element['_id'] == category['_id']);
    //       });
    //       ScaffoldMessenger.of(scaffoldContext).showSnackBar(
    //         SnackBar(content: Text('Category deleted successfully')),
    //       );
    //     } else {
    //       throw Exception('Failed to delete category: ${response.statusCode}');
    //     }
    //   } catch (err) {
    //     print('Error deleting category: $err');
    //     ScaffoldMessenger.of(scaffoldContext).showSnackBar(
    //       SnackBar(content: Text('Failed to delete category')),
    //     );
    //   }
    // }

    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const DetailsScreen(ca),
        //   ),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Text(truncatedTitle),
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Delete Course"),
                              content: Text("Are you sure want to delete?"),
                              actions: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 2, // Spread radius
                                        blurRadius: 4, // Blur radius
                                        offset:
                                            const Offset(0, 2), // Shadow offset
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        20), // Border radius
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .white, // Button background color
                                      elevation: 0, // No button elevation
                                    ),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: const Text(
                                      "No",
                                      style: TextStyle(
                                          color: Colors.black), // Text color
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                    width: 10), // Add spacing between buttons
                                Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey
                                            .withOpacity(0.5), // Shadow color
                                        spreadRadius: 2, // Spread radius
                                        blurRadius: 4, // Blur radius
                                        offset:
                                            const Offset(0, 2), // Shadow offset
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(
                                        20), // Border radius
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromRGBO(28, 21, 18,
                                          0.298), // Button background color
                                      elevation: 0, // No button elevation
                                    ),
                                    onPressed: () {
                                      // Navigator.of(context)
                                      //     .pop(); // Close the dialog
                                      // deleteCategory(
                                      //     context); // Call deleteCategory function with scaffold's context
                                    },
                                    child: const Text(
                                      "Yes",
                                      style: TextStyle(
                                          color: Colors.white), // Text color
                                    ),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    icon: const Icon(Icons.more_vert))
              ],
            ),
            // Check if cover is not null before accessing it
            if (course["cover"] != null)
              CachedNetworkImage(
                imageUrl: course["cover"]!, // URL from Api response
                height: kCategoryCardImageSize, //  Set the fixed size of Image
                width:
                    double.infinity, // Make it flexible in horizontal direction
                fit: BoxFit.cover,
              ),

            const SizedBox(height: 6),

            Text(course["title"]),
            // Text(
            //   _truncateDescription(category["description"]),
            //   style: Theme.of(context).textTheme.bodySmall,
            // )
          ],
        ),
      ),
    );
  }
}