import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/featured_screen.dart';
import 'course_detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  final String selectedCategory;
  static final List<Map<String, dynamic>> favoriteCourses = [];

  static void addToFavorites(Map<String, dynamic> course) {
    if (!favoriteCourses.contains(course)) {
      favoriteCourses.add(course);
    }
  }

  static void removeFromFavorites(Map<String, dynamic> course) {
    favoriteCourses.remove(course);
  }

  FavoriteScreen({Key? key, required this.selectedCategory}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedCategory = widget.selectedCategory.isNotEmpty
        ? jsonDecode(widget.selectedCategory)
        : {}; // Default to an empty map if the string is empty

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blueGrey[800],
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const FeaturedScreen()));
          },
        ),
        title: Text('Favorite Courses',
        style: Theme.of(context).textTheme.titleLarge,
        overflow: TextOverflow.visible,
        maxLines: null,),
      ),
      body: FavoriteScreen.favoriteCourses.isNotEmpty
          ? ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: FavoriteScreen.favoriteCourses.length,
              separatorBuilder: (context, index) => Divider(height: 32),
              itemBuilder: (context, index) {
                var course = FavoriteScreen.favoriteCourses[index];
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
            )
          : Center(child: Text('No favorite courses yet')),
    );
  }
}
