import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:online_course_app/screens/chatpter_list_screen.dart';
import 'package:online_course_app/widgets/description_section.dart';

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
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.black,
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      // Icons.help_outline_rounded,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.white,
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
                        "CodingIs Fun!",
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
                          // SizedBox(width: 15),
                          // Icon(
                          //   Icons.timer,
                          //   color: Colors.grey,
                          // ),
                          // Text(
                          //   " 60 Hours ",
                          //   style: TextStyle(
                          //     color: Colors.grey,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          Spacer(),
                          isDataLoaded
                              ? Text(
                                  "Fee: ${data['fee']}",
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
                        description:
                            selectedCategory['description'] ?? 'No description available',
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

        return Container(
          margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ListTile(
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
          ),
        );
      },
    );
  }
}
