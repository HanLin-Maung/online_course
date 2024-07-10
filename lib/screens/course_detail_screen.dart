// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:online_course_app/screens/chatpter_list_screen.dart';
// import 'package:online_course_app/widgets/description_section.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({
//     super.key,
//     required this.item,
//     required this.selectedCategory,
//   });

//   final String item;
//   final String selectedCategory;

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   List courseOutline = [];
//   Map<String, dynamic> selectedCategory = {};
//   var data;
//   bool isDataLoaded = true;
//   int tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     getCourseOutline();
//   }

//   void getCourseOutline() {
//     data = jsonDecode(widget.item);
//     selectedCategory = jsonDecode(widget.selectedCategory);
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
//                 // title: Text(
//                 //   data["title"],
//                 //   style: Theme.of(context).appBarTheme.titleTextStyle,
                  
//                 // ),
//                 leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                   ),
//                 ),
//                 backgroundColor: Colors.black,
//                 elevation: 0,
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.favorite,
//                       // Icons.help_outline_rounded,
//                       color: Colors.white,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon:const Icon(
//                       Icons.more_vert,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
                  
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           // borderRadius: BorderRadius.circular(24),
//                           image: DecorationImage(
//                             image: NetworkImage(data["cover"]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
//                         child: Text(
//                           "${data["title"]} Complete Course",
//                           style: Theme.of(context).textTheme.headlineMedium,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
//                         child: Text(
//                           "Created by MSI!",
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons.star,
//                               size: 20,
//                             ),
//                             const SizedBox(width: 5),
//                             const Text(
//                               '4.8',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             const Icon(
//                               Icons.timer,
//                               color: Colors.grey,
//                             ),
//                             const Text(
//                               " 60 Hours ",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const Spacer(),
//                             isDataLoaded
//                                 ? Text(
//                                     "Fee: ${data['fee']}",
//                                     style: Theme.of(context).textTheme.bodyMedium,
//                                   )
//                                 :const CircularProgressIndicator(),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
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
//                         outlines: courseOutline,
//                       )
//                     : DescriptionSection(
//                         description:
//                             selectedCategory['description'] ?? 'No description available',
//                       ),
//               ),
//               const SliverToBoxAdapter(
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

//   final List<String> _tags = ["Outlines", "About"];

//   Widget _buildTags(BuildContext context, int tabIndex) {
//     return GestureDetector(
//       onTap: () {
//         changeTab(tabIndex);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * .15, vertical: 15),
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
//       physics:const NeverScrollableScrollPhysics(),
//       itemCount: widget.outlines.length,
//       itemBuilder: (context, index) {
//         final outline = widget.outlines[index];
//         final title = outline['title'] ?? 'No title';

//         return Container(
//           margin:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.2),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset:const Offset(0, 3), // changes position of shadow
//               ),
//             ],
//           ),
//           child: ListTile(
//             title: Text(
//               title,
//               style: Theme.of(context).listTileTheme.titleTextStyle,
//               // style: Theme.of(context).textTheme.bodyLarge,
//             ),
            
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ChapterListScreen(outline: outline),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:online_course_app/screens/video_palyer_screen.dart';
// import 'package:online_course_app/widgets/description_section.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({
//     super.key,
//     required this.item,
//     required this.selectedCategory,
//   });

//   final String item;
//   final String selectedCategory;

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   List courseOutline = [];
//   Map<String, dynamic> selectedCategory = {};
//   var data;
//   bool isDataLoaded = true;
//   int tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     getCourseOutline();
//   }

//   void getCourseOutline() {
//     data = jsonDecode(widget.item);
//     selectedCategory = jsonDecode(widget.selectedCategory);
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
//                 leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                   ),
//                 ),
//                 backgroundColor: Colors.black,
//                 elevation: 0,
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.favorite,
//                       color: Colors.white,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.more_vert,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(data["cover"]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
//                         child: Text(
//                           "${data["title"]} Complete Course",
//                           style: Theme.of(context).textTheme.headlineMedium,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
//                         child: Text(
//                           "Created by MSI!",
//                           style: Theme.of(context).textTheme.bodyLarge,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
//                         child: Row(
//                           children: [
//                             const Icon(
//                               Icons.star,
//                               size: 20,
//                             ),
//                             const SizedBox(width: 5),
//                             const Text(
//                               '4.8',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             const SizedBox(width: 15),
//                             const Icon(
//                               Icons.timer,
//                               color: Colors.grey,
//                             ),
//                             const Text(
//                               " 60 Hours ",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const Spacer(),
//                             isDataLoaded
//                                 ? Text(
//                                     "Fee: ${data['fee']}",
//                                     style: Theme.of(context).textTheme.bodyMedium,
//                                   )
//                                 : const CircularProgressIndicator(),
//                           ],
//                         ),
//                       ),
//                       const SizedBox(height: 20),
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
//                     ? ExpandableOutlineList(
//                         outlines: courseOutline,
//                       )
//                     : DescriptionSection(
//                         description:
//                             selectedCategory['description'] ?? 'No description available',
//                       ),
//               ),
//               const SliverToBoxAdapter(
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

//   final List<String> _tags = ["Outlines", "About"];

//   Widget _buildTags(BuildContext context, int tabIndex) {
//     return GestureDetector(
//       onTap: () {
//         changeTab(tabIndex);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * .15, vertical: 15),
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

// class ExpandableOutlineList extends StatelessWidget {
//   final List outlines;

//   const ExpandableOutlineList({super.key, required this.outlines});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: outlines.length,
//       itemBuilder: (context, index) {
//         final outline = outlines[index];
//         final title = outline['title'] ?? 'No title';
//         final chapters = outline['chapters'] ?? [];

//         return Container(
//           margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade300,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: ExpansionTile(
//             title: Text(
//               '${index + 1}. $title',
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             children: chapters.asMap().entries.map<Widget>((entry) {
//               final chapterIndex = entry.key;
//               final chapter = entry.value;

//               return Column(
//                 children: [
//                   ListTile(
//                     title: Text(
//                       '${index + 1}.${chapterIndex + 1} ${chapter['title'] ?? 'No title'}',
//                       style: Theme.of(context).textTheme.bodyMedium,
//                     ),
//                     onTap: () {
//                       final videoUrl = chapter['video'];
//                       if (videoUrl != null && videoUrl.isNotEmpty) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => VideoPlayerScreen(videoUrl: videoUrl),
//                           ),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Video not available for this chapter'),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                   if (chapterIndex < chapters.length - 1)
//                     const Divider(
//                       color: Colors.grey,
//                       indent: 16.0,
//                       endIndent: 16.0,
//                     ),
//                 ],
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/video_palyer_screen.dart';
import 'package:online_course_app/widgets/description_section.dart';
import 'favorite_screen.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({
    super.key,
    required this.item,
    required this.selectedCategory,
  });

  final String item;
  final String selectedCategory;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List courseOutline = [];
  Map<String, dynamic> selectedCategory = {};
  var data;
  bool isDataLoaded = true;
  int tabIndex = 0;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    getCourseOutline();
  }

  void getCourseOutline() {
    data = jsonDecode(widget.item);
    selectedCategory = jsonDecode(widget.selectedCategory);
    courseOutline = data["outlines"];
    setState(() {});
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      FavoriteScreen.addToFavorites(data);
    } else {
      FavoriteScreen.removeFromFavorites(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blueGrey[800],
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: toggleFavorite,
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoriteScreen(
                            selectedCategory: jsonEncode(selectedCategory),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.route,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(data["cover"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
                        child: Text(
                          "${data["title"]} Complete Course",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
                        child: Text(
                          "Created by MSI!",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      SizedBox(height: 3),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10.0, 5, 10.0, 0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 20,
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              '4.8',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 15),
                            const Icon(
                              Icons.timer,
                              color: Colors.grey,
                            ),
                            const Text(
                              " 60 Hours ",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            isDataLoaded
                                ? Text(
                                    "Fee: ${data['fee']}",
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  )
                                : const CircularProgressIndicator(),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: CustomTabView(
                  index: tabIndex,
                  changeTab: (index) {
                    setState(() {
                      tabIndex = index;
                    });
                  },
                ),
              ),
              SliverToBoxAdapter(
                
                child: tabIndex == 0
                    ? ExpandableOutlineList(
                        outlines: courseOutline,
                      )
                    : DescriptionSection(
                        description:
                            selectedCategory['description'] ?? 'No description available',
                            
                      ),
                      
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 60), // Add some space at the bottom
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomTabView extends StatelessWidget {
  final Function(int) changeTab;
  final int index;

  CustomTabView({Key? key, required this.changeTab, required this.index})
      : super(key: key);

  final List<String> _tags = ["Outlines", "About"];

  Widget _buildTags(BuildContext context, int tabIndex) {
    return GestureDetector(
      onTap: () {
        changeTab(tabIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .15, vertical: 15),
        decoration: BoxDecoration(
          color: index == tabIndex ? Colors.blueGrey[800] : null,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          _tags[tabIndex],
          style: TextStyle(
            color: index != tabIndex ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.shade200,
      ),
      child: Row(
        children: List.generate(
          _tags.length,
          (index) => _buildTags(context, index),
        ),
      ),
    );
  }
}

class ExpandableOutlineList extends StatelessWidget {
  final List outlines;

  const ExpandableOutlineList({super.key, required this.outlines});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: outlines.length,
      itemBuilder: (context, index) {
        final outline = outlines[index];
        final title = outline['title'] ?? 'No title';
        final chapters = outline['chapters'] ?? [];

        return Container(
          margin: const EdgeInsets.symmetric( horizontal: 20.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(5),
          ),
          child: ExpansionTile(
            title: Text(
              '${index + 1}. $title',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            children: chapters.asMap().entries.map<Widget>((entry) {
              final chapterIndex = entry.key;
              final chapter = entry.value;
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${index + 1}.${chapterIndex + 1} ${chapter['title'] ?? 'No title'}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () {
                      final videoUrl = chapter['video'];
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
                  ),
                  if (chapterIndex < chapters.length - 1)
                    const Divider(
                      color: Colors.grey,
                      indent: 16.0,
                      endIndent: 16.0,
                    ),
                ],
              );
            }).toList(),
          ),
        );
      },
    );
  }
}


