import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/utils/constants/color_constants.dart';
import 'package:quiz_app/view/choseCategory_screen/choseCategory_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key,
      required this.rightAnswerCount,
      required this.wrongAnswers,
      this.skipAnswer});
  final int rightAnswerCount;
  final int wrongAnswers;
  final int? skipAnswer;

  @override
  Widget build(BuildContext context) {
    double percentage = rightAnswerCount * 100 / DummyDb.question.length;
    int wrong = wrongAnswers;

    return Scaffold(
      backgroundColor: ColorConstants.MAINWHITE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "congrats",
              style: TextStyle(
                fontSize: 25,
                color: ColorConstants.ORANGE,
              ),
            ),
            Text(
              "$percentage%",
              style: TextStyle(
                  fontSize: 30,
                  color: ColorConstants.GREEN,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Correct Answers: $rightAnswerCount",
              style: TextStyle(
                  fontSize: 15,
                  color: ColorConstants.MAINWHITE,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Wrong Answers: $wrong",
              style: TextStyle(
                  fontSize: 15,
                  color: ColorConstants.MAINWHITE,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Skipped Questions: $skipAnswer",
              style: TextStyle(
                  fontSize: 15,
                  color: ColorConstants.MAINWHITE,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChosecategoryScreen(),
                  ),
                  (route) => false,
                );
              },
              child: Container(
                child: Center(
                  child: Text(
                    "Restart",
                    style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.MAINWHITE,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                    color: ColorConstants.ORANGE,
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 2, color: ColorConstants.MAINWHITE)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
