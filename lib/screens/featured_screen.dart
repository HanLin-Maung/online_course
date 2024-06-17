import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_course_app/Api/api.dart';

import 'package:online_course_app/constants/color.dart';
import 'package:online_course_app/constants/size.dart';
import 'package:online_course_app/screens/course_detail_screen.dart';
import 'package:online_course_app/screens/course_screen.dart';
import 'package:online_course_app/screens/detail_screen.dart';
import 'package:online_course_app/screens/edit_category_screen.dart';
import 'package:online_course_app/widgets/main_drawer.dart';

List categoryList = [];

class FeaturedScreen extends StatefulWidget {
  const FeaturedScreen({super.key});
  @override
  State<FeaturedScreen> createState() => _FeaturedScreenState();
}

class _FeaturedScreenState extends State<FeaturedScreen> {
  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  getAllCategories() async {
    try {
      var response = await API().getAllCategoriesApi();

      if (response.statusCode == 201) {
        var res = json.decode(response.body);
        if (res["success"] == true) {
          setState(() {
            categoryList = res['categories'];
          });
        }
      } else {
        throw Exception('Failed to load categories: ${response.statusCode}');
      }
    } catch (err) {
      print('Error fetching categories: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Builder(
        builder: (context) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AppBar(),
                Body(categories: categoryList),
              ],
            ),
          ),
          // drawer: const MainDrawer(),
        ),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key, required this.categories});

  final List categories;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool showAllCategories = false;

  // Toggle between showing all categories and showing only a subset
  void toggleShowAllCategories() {
    setState(() {
      showAllCategories = !showAllCategories;
    });
  }

  // Truncate the description if it exceeds the maximum number of words
  String _truncateDescription(String description) {
    const int maxWords = 8;
    final words = description.split(' ');
    if (words.length <= maxWords) {
      return description;
    } else {
      final truncatedDescription = words.take(maxWords).join(' ') + '...';
      // final truncatedDescription = '${words.take(maxWords).join(' ')}...';
      return truncatedDescription;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 600;

    final List<Widget> categoryItems = showAllCategories
        ? widget.categories.map<Widget>((category) {
            return _buildCategoryItem(category);
          }).toList()
        : widget.categories.take(4).map<Widget>((category) {
            return _buildCategoryItem(category);
          }).toList();
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore Categories",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextButton(
                    onPressed: toggleShowAllCategories,
                    child: Text(
                      showAllCategories ? "Show Less" : "See All",
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
              childAspectRatio: 0.65,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: categoryItems,
            ),
          ],
        ),
      ),
    );
  }

  // Build category item widget
  Widget _buildCategoryItem(Map<String, dynamic> category) {
    void deleteCategory(BuildContext scaffoldContext) async {
      try {
        var response = await API().deleteCategory(category['_id']);
        if (response.statusCode == 200) {
          setState(() {
            categoryList
                .removeWhere((element) => element['_id'] == category['_id']);
          });
          ScaffoldMessenger.of(scaffoldContext).showSnackBar(
            SnackBar(content: Text('Category deleted successfully')),
          );
        } else {
          throw Exception('Failed to delete category: ${response.statusCode}');
        }
      } catch (err) {
        print('Error deleting category: $err');
        ScaffoldMessenger.of(scaffoldContext).showSnackBar(
          SnackBar(content: Text('Failed to delete category')),
        );
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(cover: category['cover'] ?? '',title: category['title'] ?? '',
              categoryId: category['_id'] ?? '',
            ),
          ),
        );
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
            // Check if cover is not null before accessing it
            if (category["cover"] != null)
              CachedNetworkImage(
                imageUrl: category["cover"]!, // URL from Api response
                height: kCategoryCardImageSize, //  Set the fixed size of Image
                width:
                    double.infinity, // Make it flexible in horizontal direction
                fit: BoxFit.cover,
              ),

            const SizedBox(height: 6),

            Text(
              category["title"],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              _truncateDescription(category["description"]),
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatefulWidget {
  const AppBar({super.key});

  @override
  State<AppBar> createState() => _AppBarState();
}

class _AppBarState extends State<AppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 130,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          gradient: RadialGradient(
            colors: [
              Color.fromARGB(255, 52, 71, 81),
              Color.fromARGB(255, 30, 39, 44),
            ],
            radius: 0.9,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 4,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu),
                color: Colors.white,
              ),
              Text(
                'Hello,\nWelcome Back',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              //CircleButton(icon: Icons.notifications, onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}