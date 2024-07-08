import 'package:flutter/material.dart';
import 'package:online_course_app/constants/color.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 25,
        ),
        suffixIcon: const Icon(
          Icons.arrow_circle_right,
          color: kPrimaryColor,
          size: 30,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: "Search Category",
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40)
        ),
        isDense: true,
      ),
    );
  }
}