import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const domain = "https://coding-is-fun.onrender.com/api/v1";

class API {

  login(String email, password) async {
    try {
      var response = await http.post(
        Uri.parse('$domain/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {'email': email, 'password': password},
        ),
      );
      return response;
    } catch (err) {
      // print(err.toString());
      throw Exception('Failed to connect to the server: $err');
    }
  }

  register(String name, String email, password) async {
    try {
      var response = await http.post(
        Uri.parse('$domain/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          {'name': name, 'email': email, 'password': password},
        ),
      );
      return response;
    } catch (err) {
      // print(err.toString());
      throw Exception('Failed to connect to the server: $err');
    }
  }

  getAllCategoriesApi() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var response = await http.get(
        Uri.parse('$domain/get-all-categories'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } catch (err) {
      print(">>>>>>>>>> category err ${err.toString()}");
    }
  }

  createCategoryApi(title, description, image) async {
    final prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("token");

    try {
      var url = "$domain/create-category";
      var body = jsonEncode({
        'title': title,
        'description': description,
        'cover': image,
        "paid": false,
        "outlines": [],
        "coverVideo": ""
      });
      print(">>>>>>>>>>> create category url $url");
      print(">>>>>>>>>>> create category body $body");
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );
      return response;
    } catch (error) {
      print(error.toString());
    }
  }

  updateCategoryApi(title, description, image) async {
    final prefs = await SharedPreferences.getInstance();

    var token = prefs.getString("token");

    try {
      var url = "$domain/update-category";
      var body = jsonEncode({
        'title': title,
        'description': description,
        'cover': image,
      });
      print(">>>>>>>>>>> update category url $url");
      print(">>>>>>>>>>> update category body $body");
      var response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: body,
      );
      return response;
    } catch (error) {
      print(error.toString());
    }
  }

  deleteCategory(String categoryId) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");

    try {
      var url = "$domain/delete-category/$categoryId";
      var response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } catch (error) {
      print(error.toString());
    }
  }

  // Future<List<dynamic>> getCourseList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString('token');

  //   try {
  //     var response = await http.get(
  //       Uri.parse('$domain/get-all-courses'),
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //         'Authorization': 'Bearer $token',
  //       },
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       Map<String, dynamic> jsonResponse = json.decode(response.body);
  //       List<dynamic> courseList = jsonResponse['courses'];
  //       print('Course List: $courseList'); // Debug print
  //       return courseList;
  //     } else {
  //       throw Exception('Failed to fetch course list');
  //     }
  //   } catch (error) {
  //     throw Exception('Error: $error');
  //   }
  // }   

  getCourseList() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var response = await http.get(
        Uri.parse('$domain/get-all-courses'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } catch (err) {
      print(err.toString());
    }
  }

  Future<List<dynamic>> getCoursesByCategoryId(String categoryId) async {
  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');

  try {
    var response = await http.get(
      Uri.parse('$domain/get-all-courses-by-categoryId/$categoryId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    print(response.body); // Print the response
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> courses = json.decode(response.body)['courses'];
      return courses;
    } else {
      throw Exception('Failed to fetch courses by category ID han-lin');
    }
  } catch (error) {
    throw Exception('Error: $error');
  }
}

  getOneCourse(String categoryid) async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var response = await http.get(
        Uri.parse('$domain/get-all-courses-by-categoryId/$categoryid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );
      return response;
    } catch (err) {
      print(err.toString());
    }
  }

  
}
