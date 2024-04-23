import 'dart:convert';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_course_app/Api/api.dart';
import 'package:online_course_app/screens/featured_screen.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
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

  // // >>> between codes are gpt codes testing  purpose only <<<

  // Future<String?> _uploadImageToFirebase(File imageFile) async {
  //   try {
  //     final Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
  //     final UploadTask uploadTask = storageReference.putFile(imageFile);
  //     final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() => null)!);
  //     final String url = await downloadUrl.ref.getDownloadURL();
  //     return url;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // void createCategory() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   // Upload image to Firebase Storage
  //   final imageUrl = await _uploadImageToFirebase(_image!);

  //   // After uploading, call API with image URL
  //   // Pass imageUrl along with other category data to your API

  //   setState(() {
  //     isLoading = false;
  //   });
  // }
  //   // >>>> gpt end <<<<

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appbar(context),
                const SizedBox(height: 30),
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
                    createCategory();
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
                            "Add Category",
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

  uploadimagetoFirebase() async {
    String imageUrl = "";
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

  // comment out cause of gpt testing
  createCategory() async {
    String imageURL = await uploadimagetoFirebase();
    final response = await API().createCategoryApi(
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
}

Widget _appbar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      IconButton(
        icon: Icon(Icons.arrow_back_outlined),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        "Back",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      )
    ],
  );
}