// this screen is copy from gpt to split course_detail_screen

import 'package:flutter/material.dart';

class EnrollBottomSheet extends StatelessWidget {
  final dynamic course;
  final Function addToFavorites;

  const EnrollBottomSheet({
    required this.course,
    required this.addToFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Enroll in this course',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Handle enrollment logic here
            },
            child: Text('Enroll Now'),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {
              addToFavorites(course);
            },
            child: Text('Add to Favorites'),
          ),
        ],
      ),
    );
  }
}
