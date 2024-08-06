import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants/color_constants.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab(
      {super.key, required this.url, required this.title, required this.word});
  final String url, title, word;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 80,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: ColorConstants.MAINWHITE,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  word,
                  style:
                      TextStyle(color: ColorConstants.MAINWHITE, fontSize: 16),
                )
              ],
            ),
            height: 200,
            width: 180,
            decoration: BoxDecoration(
                color: ColorConstants.MAINGREY.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(
          bottom: 120,
          left: 5,
          child: Image.asset(
            url,
            height: 120,
          ),
        ),
      ],
    );
  }
}
