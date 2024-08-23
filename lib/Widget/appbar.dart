import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HeadingTitle extends StatelessWidget {
  HeadingTitle({super.key, required this.title, required this.subTitle});
  String subTitle;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subTitle,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Container(
          width: 20,
          height: 4,
          color: Colors.red,
        )
      ],
    );
  }
}
