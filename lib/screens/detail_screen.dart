import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/constants/color.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.courseId});

  final String courseId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  dynamic course;
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    fetchCourseDetails();
  }
  Future<void> fetchCourseDetails() async{
    try {
      final response = await API().getOneCourse(widget.courseId);
      if (response.statusCode == 201) {
        final responseBody = jsonDecode(response.body);
        if (mounted) {
          // Check if the widget is still mounted
          setState(() {
            course = responseBody;
          });
        }
      } else {
        throw Exception('Failed to load course');
      }
    } catch (error) {
      // Handle error
      print(error.toString());
    }
  }
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
      ),
      body: course == null
          ? Center(
              child: CircularProgressIndicator(), // Or show an error message
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course['title'] != null
                        ? course['title'].toString()
                        : 'No Title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Description:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    course['description'] != null
                        ? course['description'].toString()
                        : 'No Description',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Fee:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    course['fee'] != null ? course['fee'].toString() : '0',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Duration:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    course['duration'] != null
                        ? course['duration'].toString()
                        : 'No Duration',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  // Add more details if needed
                ],
              ),
            ),
    );

  }
}


