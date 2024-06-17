// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/widgets/description_section.dart';
// import 'package:http/http.dart' as http;
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({super.key, required this.item});

//   final String item;

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   List courseOutline = [];
//   var data;
//   bool isDataLoaded = true;
//   int tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     getCourseOutline();
//   }

//   getCourseOutline() {
//     data = jsonDecode(widget.item);
//     courseOutline = data["outlines"];
//     setState(() {});
//   }

//   void addToFavorites(dynamic course) {
//     print('Course added to favorites: $course');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             CustomScrollView(
//               slivers: [
//                 SliverAppBar(
//                   pinned: true,
//                   centerTitle: true,
//                   title: Text(
//                     data["title"],
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 0,
//                     ),
//                   ),
//                   leading: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(
//                       Icons.arrow_back,
//                       color: Colors.black,
//                     ),
//                   ),
//                   backgroundColor: Colors.white,
//                   elevation: 0,
//                   actions: [
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.help_outline_rounded,
//                         color: Colors.black,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.more_vert,
//                         color: Colors.black,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SliverToBoxAdapter(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 180,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24),
//                             image: DecorationImage(
//                               image: NetworkImage(data["cover"]),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           "${data["title"]} Complete Course",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         SizedBox(height: 3),
//                         Text(
//                           "Created by MSI",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                           ),
//                         ),
//                         SizedBox(height: 3),
//                         Row(
//                           children: [
//                             Icon(
//                               Icons.star,
//                               size: 20,
//                             ),
//                             SizedBox(width: 5),
//                             Text(
//                               '4.8',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 16,
//                               ),
//                             ),
//                             SizedBox(width: 15),
//                             Icon(
//                               Icons.timer,
//                               color: Colors.grey,
//                             ),
//                             Text(
//                               " 60 Hours ",
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Spacer(),
//                             isDataLoaded
//                                 ? Text(
//                                     "${courseOutline[0]['title']}",
//                                     style: TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                     ),
//                                   )
//                                 : CircularProgressIndicator(),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: CustomTabView(
//                     index: tabIndex,
//                     changeTab: (index) {
//                       setState(() {
//                         tabIndex = index;
//                       });
//                     },
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: tabIndex == 0
//                       ? OutlineList(
//                           outlines: courseOutline[0]['outlines'] ?? [],
//                         )
//                       : DescriptionSection(
//                           description: courseOutline[0]['description'] ??
//                               'No description available',
//                         ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: SizedBox(height: 60), // Add some space at the bottom
//                 ),
//               ],
//             ),
//             if (tabIndex == 0)
//               Positioned(
//                 left: 20,
//                 right: 0,
//                 bottom: 20, // Adjusted bottom value
//                 child: EnrollBottomSheet(
//                   course: courseOutline[0],
//                   addToFavorites: addToFavorites,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CustomTabView extends StatelessWidget {
//   final Function(int) changeTab;
//   final int index;

//   CustomTabView({Key? key, required this.changeTab, required this.index})
//       : super(key: key);

//   final List<String> _tags = ["Outlines", "Description"];

//   Widget _buildTags(BuildContext context, int tabIndex) {
//     return GestureDetector(
//       onTap: () {
//         changeTab(tabIndex);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * .16, vertical: 15),
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

// class OutlineList extends StatelessWidget {
//   final List<dynamic> outlines;

//   OutlineList({required this.outlines});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: outlines.length,
//       itemBuilder: (context, index) {
//         var outline = outlines[index];
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//           child: InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ChapterListScreen(outline: outline),
//                 ),
//               );
//             },
//             child: Card(
//               color: Colors.white,
//               elevation: 2,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(16),
//                 title: Text(outline['title'],
//                     style: TextStyle(fontWeight: FontWeight.bold)),
//                 trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class ChapterListScreen extends StatelessWidget {
//   final Map<String, dynamic> outline;

//   ChapterListScreen({required this.outline});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(outline['title'],
//             style: TextStyle(fontWeight: FontWeight.bold)),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: ListView.builder(
//         itemCount: outline['chapters'].length,
//         itemBuilder: (context, index) {
//           var chapter = outline['chapters'][index];
//           String? videoUrl = chapter['video'];
//           return Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
//             child: InkWell(
//               onTap: () {
//                 if (videoUrl != null && videoUrl.isNotEmpty) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           VideoPlayerScreen(videoUrl: videoUrl),
//                     ),
//                   );
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Video not available for this chapter'),
//                     ),
//                   );
//                 }
//               },
//               child: Card(
//                 color: Colors.white,
//                 elevation: 2,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ListTile(
//                   contentPadding: EdgeInsets.all(16),
//                   title: Text(chapter['title'],
//                       style: TextStyle(fontWeight: FontWeight.bold)),
//                   trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class VideoPlayerScreen extends StatefulWidget {
//   final String videoUrl;

//   VideoPlayerScreen({required this.videoUrl});

//   @override
//   _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late YoutubePlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? "",
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: false,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Video Player"),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//       ),
//     );
//   }
// }

// class EnrollBottomSheet extends StatelessWidget {
//   final dynamic course;
//   final Function(dynamic) addToFavorites;

//   EnrollBottomSheet({required this.course, required this.addToFavorites});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
//       decoration: BoxDecoration(
//         color: Colors.black,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           Column(
//             children: [
//               Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: IconButton(
//                   onPressed: () {
//                     addToFavorites(course);
//                   },
//                   icon: Icon(Icons.favorite_border_outlined),
//                   color: Colors.black,
//                 ),
//               ),
//               Text(
//                 "Add to\nfavorites",
//                 style: TextStyle(color: Colors.white),
//               )
//             ],
//           ),
//           SizedBox(width: 30),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.grey.shade200,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//               ),
//               child: Text(
//                 "ENROLL NOW",
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }


// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:online_course_app/Api/api.dart';
// import 'package:online_course_app/screens/chatpter_list_screen.dart';
// import 'package:online_course_app/screens/featured_screen.dart';
// import 'package:online_course_app/widgets/description_section.dart';
// import 'package:online_course_app/widgets/outline_list.dart';

// class CourseDetailScreen extends StatefulWidget {
//   const CourseDetailScreen({super.key, required this.item});

//   final String item;

//   @override
//   State<CourseDetailScreen> createState() => _CourseDetailScreenState();
// }

// class _CourseDetailScreenState extends State<CourseDetailScreen> {
//   List courseOutline = [];
//   var data;
//   bool isDataLoaded = true;
//   int tabIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     getCourseOutline();
//   }

//   getCourseOutline() {
//     data = jsonDecode(widget.item);
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
//                 title: Text(
//                   data["title"],
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     letterSpacing: 0,
//                   ),
//                 ),
//                 leading: IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: Colors.black,
//                   ),
//                 ),
//                 backgroundColor: Colors.white,
//                 elevation: 0,
//                 actions: [
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.help_outline_rounded,
//                       color: Colors.black,
//                     ),
//                   ),
//                   IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.more_vert,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               SliverToBoxAdapter(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 180,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(24),
//                           image: DecorationImage(
//                             image: NetworkImage(data["cover"]),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       Text(
//                         "${data["title"]} Complete Course",
//                         style: TextStyle(
//                           fontSize: 22,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Text(
//                         "Created by MSI",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       SizedBox(height: 3),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.star,
//                             size: 20,
//                           ),
//                           SizedBox(width: 5),
//                           Text(
//                             '4.8',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                           SizedBox(width: 15),
//                           Icon(
//                             Icons.timer,
//                             color: Colors.grey,
//                           ),
//                           Text(
//                             " 60 Hours ",
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Spacer(),
//                           isDataLoaded
//                               ? Text(
//                                 "${data['fee']}",
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 20,
//                                   ),
//                                 )
//                               : CircularProgressIndicator(),
//                         ],
//                       ),
//                       SizedBox(height: 20),
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
//                         outlines: courseOutline[0]['outlines'] ?? [],
//                       )
//                     : DescriptionSection(
//                         description: courseOutline[0]['description'] ??
//                             'No description available',
//                       ),
//               ),
//               SliverToBoxAdapter(
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

//   final List<String> _tags = ["Outlines", "Description"];

//   Widget _buildTags(BuildContext context, int tabIndex) {
//     return GestureDetector(
//       onTap: () {
//         changeTab(tabIndex);
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width * .14, vertical: 15),
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
//         // children: _tags
        
//         // .asMap()
//         // .entries
//         // .map((MapEntry map) => _buildTags(map.key))
//         // .toList(),
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
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: widget.outlines.length,
//       itemBuilder: (context, index) {
//         final outline = widget.outlines[index];
//         final title = outline['title'] ?? 'No title';

//         return ListTile(
//           title: Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
            
//             ),
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ChapterListScreen(outline: outline),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/chatpter_list_screen.dart';
import 'package:online_course_app/widgets/description_section.dart';

class CourseDetailScreen extends StatefulWidget {
  const CourseDetailScreen({super.key, required this.item});

  final String item;

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  List courseOutline = [];
  var data;
  bool isDataLoaded = true;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    getCourseOutline();
  }

  void getCourseOutline() {
    data = jsonDecode(widget.item);
    courseOutline = data["outlines"];
    setState(() {});
  }

  void addToFavorites(dynamic course) {
    print('Course added to favorites: $course');
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
                title: Text(
                  data["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0,
                  ),
                ),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.help_outline_rounded,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          image: DecorationImage(
                            image: NetworkImage(data["cover"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "${data["title"]} Complete Course",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "Created by MSI",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 20,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(width: 15),
                          Icon(
                            Icons.timer,
                            color: Colors.grey,
                          ),
                          Text(
                            " 60 Hours ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          isDataLoaded
                              ? Text(
                                  "${data['fee']}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                )
                              : CircularProgressIndicator(),
                        ],
                      ),
                      SizedBox(height: 20),
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
                    ? OutlineList(
                        outlines: courseOutline,
                      )
                    : DescriptionSection(
                        description: data['description'] ?? 'No description available',
                      ),
              ),
              SliverToBoxAdapter(
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

  final List<String> _tags = ["Outlines", "Description"];

  Widget _buildTags(BuildContext context, int tabIndex) {
    return GestureDetector(
      onTap: () {
        changeTab(tabIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .14, vertical: 15),
        decoration: BoxDecoration(
          color: index == tabIndex ? Colors.black : null,
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

class OutlineList extends StatefulWidget {
  final List outlines;

  const OutlineList({super.key, required this.outlines});

  @override
  State<OutlineList> createState() => _OutlineListState();
}

class _OutlineListState extends State<OutlineList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.outlines.length,
      itemBuilder: (context, index) {
        final outline = widget.outlines[index];
        final title = outline['title'] ?? 'No title';

        return ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            
            ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChapterListScreen(outline: outline),
              ),
            );
          },
        );
      },
    );
  }
}

 


          // if (tabIndex == 0)
          //   Positioned(
          //     left: 20,
          //     right: 0,
          //     bottom: 20, // Adjusted bottom value
          //     child: EnrollBottomSheet(
          //       course: courseOutline[0],
          //       addToFavorites: addToFavorites,
          //     ),
          //   ),// body: Center(
      //   child: Text("test"),
      // ),
    