
// this screen is copy from gpt to split course_detail_screen
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/video_palyer_screen.dart';


class ChapterListScreen extends StatelessWidget {
  final Map<String, dynamic> outline;

  ChapterListScreen({required this.outline});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(outline['title'],
            style: TextStyle(
              fontSize: 20,
              // color: Colors.white,
              fontWeight: FontWeight.bold,
              ),),
              
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: outline['chapters'].length,
        itemBuilder: (context, index) {
          var chapter = outline['chapters'][index];
          String? videoUrl = chapter['video'];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: InkWell(
              onTap: () {
                if (videoUrl != null && videoUrl.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Video not available for this chapter'),
                    ),
                  );
                }
              },
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(chapter['title'],
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
