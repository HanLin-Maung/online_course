// import 'package:flutter/material.dart';

// class SearchCategory extends SearchDelegate{
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return [
//       IconButton(
//         onPressed: (){
//           query = "";
//         }, 
//         icon: Icon(Icons.close),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(
//       onPressed: (){
//         Navigator.pop(context);
//       }, 
//       icon:const Icon(Icons.arrow_back_ios)
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     return Center(
//       child: Text("Search Category"),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     return Center(
//       child: Text("Search Category"),
//     );
//   }

// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/course_screen.dart';

class SearchCategory extends SearchDelegate {
  final List categories;

  SearchCategory({required this.categories});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List filteredCategories = categories.where((category) {
      return category['title'].toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredCategories.isEmpty) {
      return Center(child: Text("No categories found"));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 600;
        return GridView.count(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          crossAxisCount: isWideScreen ? 4 : 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: filteredCategories.map<Widget>((category) {
            return _buildCategoryItem(context, category);
          }).toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Center(child: Text("Type to search categories"));
    }

    final List filteredCategories = categories.where((category) {
      return category['title'].toString().toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredCategories.isEmpty) {
      return Center(child: Text("No categories found"));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 600;
        return GridView.count(
          shrinkWrap: true,
          primary: false,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          crossAxisCount: isWideScreen ? 4 : 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          children: filteredCategories.map<Widget>((category) {
            return _buildCategoryItem(context, category);
          }).toList(),
        );
      },
    );
  }

  Widget _buildCategoryItem(BuildContext context, Map<String, dynamic> category) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(
              selectedCategory: jsonEncode(category),
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
            if (category["cover"] != null)
              Image.network(
                category["cover"],
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 6),
            Text(
              category["title"],
              maxLines: 2,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              _truncateDescription(category["description"]),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  String _truncateDescription(String description) {
    const int maxWords = 7;
    final words = description.split(' ');
    if (words.length <= maxWords) {
      return description;
    } else {
      return '${words.take(maxWords).join(' ')}...';
    }
  }

  @override
  Widget buildSearchField(BuildContext context) {
    return TextFormField(
      controller: TextEditingController(text: query),
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search categories...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey),
      ),
      style: TextStyle(color: Colors.black, fontSize: 16.0),
      onChanged: (text) {
        query = text;
        showSuggestions(context);
      },
    );
  }
}


