// import 'package:flutter/material.dart';

// class DescriptionSection extends StatefulWidget {
//   const DescriptionSection({super.key, required this.description});
//   final String description;

//   @override
//   State<DescriptionSection> createState() => _DescriptionSectionState();
// }

// class _DescriptionSectionState extends State<DescriptionSection> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding:  EdgeInsets.all(16.0),
//       child: const Text(
//         'description',
//         style: TextStyle(
//           fontSize: 16.0,
//           height: 1.5,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  final String description;

  const DescriptionSection({required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        description,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
