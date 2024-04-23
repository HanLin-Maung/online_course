import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/screens/featured_screen.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({super.key, required this.category});

  final Map<String, dynamic> category;

  @override
  State<EditCategoryScreen> createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  
   @override
  void initState() {
    super.initState();
    // Initialize controllers and image state with category data
    _titleController.text = widget.category['title'] ?? '';
    _descriptionController.text = widget.category['description'] ?? '';
    // You can initialize the image here if cover image URL is available in the category data
    // _image = File(widget.category['cover']);
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  bool isLoading = false;
  late File? _image = null;

  Future<void> _getImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appbar(context),
                const SizedBox(height: 20),
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: "Title",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    alignLabelWithHint: true,
                  ),
                  maxLines: 4,
                ),
                const SizedBox(
                  height: 20,
                ),
                _image != null
                    ? Image.file(_image!)
                    : const Text("No image selected"),
                ElevatedButton(
                  onPressed: _getImage,
                  child: const Text("Select Image"),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    updateCategory();
                  },
                  height: 50,
                  color: Colors.blueGrey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: isLoading
                        ? const SpinKitRing(
                            color: Colors.white,
                            size: 30,
                            lineWidth: 2,
                          )
                        : const Text(
                            "Edit Category",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  updateCategory() async {
    String? imageURL;
    if (_image != null) {
    String imageURL = await uploadimagetoFirebase();}
    final response = await API().updateCategoryApi(
      _titleController.text,
      _descriptionController.text,
      imageURL, // Pass image to the API method
    );
    print(">>>>here<<<<");
    var res = jsonDecode(response.body);
    print(
        ">>>>>>>>>>> create category response statusCode ${response.statusCode}");
    print(">>>>>>>>>>> create category response body ${response.body}");
    if (response.statusCode == 201) {
      print("here 0--");
      if (res['success'] == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FeaturedScreen(),
          ),
        );
      }
    } else if (response.statusCode == 400) {
      // Handle error case here
    }
    setState(() {
      isLoading = false;
    });
  }


  uploadimagetoFirebase() async {
    String imageUrl = "";   // Initialize with an empty string
    print(">>>> 1");
    if (_image != null) {
      print(">>>> 2");
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference reference =
          FirebaseStorage.instance.ref().child('images/$fileName');
      print(">>>> 3");
      UploadTask uploadTask = reference.putFile(_image!);
      TaskSnapshot taskSnapshot = await uploadTask;
      print(">>>> 4");
      imageUrl = await taskSnapshot.ref.getDownloadURL();
      print(">>>> 5");
    }
    print(">>>> 6");
    print(imageUrl);
    return imageUrl;
  }

}




// Widget _appBar(BuildContext context) {
//     return AppBar(
//       leading: IconButton(
//         icon: const Icon(Icons.arrow_back_outlined),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       title: const Text("Edit Category"),
//     );
//   }

Widget _appbar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        icon:const Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      const SizedBox(
        width: 5,
      ),
      const Text(
        "Back",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      )
    ],
  );
}