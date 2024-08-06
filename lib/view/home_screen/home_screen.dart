import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants/color_constants.dart';
import 'package:quiz_app/view/home_screen/widgets/options_card.dart';
import 'package:quiz_app/view/result_screen/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.qA,
  });
  final List? qA;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentQstnIndex = 0;
  int? selectedIndex;
  int rightAnswerCount = 0;
  int skipCount = 0;
  int wrongcount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.MAINBLACK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Text(
            "${currentQstnIndex + 1}/${widget.qA!.length}",
            style: TextStyle(color: ColorConstants.MAINWHITE, fontSize: 18),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorConstants.MAINGREY.withOpacity(0.5)),
              child: Column(
                children: [
                  Text(
                    widget.qA![currentQstnIndex]['question'],
                    style: TextStyle(
                        color: ColorConstants.MAINWHITE, fontSize: 20),
                  ),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                4,
                (index) {
                  List ansOption = widget.qA![currentQstnIndex]['options'];
                  return OptionsCard(
                    options: ansOption[index],
                    borderColor: getColor(index),
                    onTap: () {
                      if (selectedIndex == null) {
                        setState(() {
                          selectedIndex = index;
                          if (selectedIndex ==
                              widget.qA![currentQstnIndex]['answerIndex']) {
                            rightAnswerCount++;
                            print(rightAnswerCount);
                          } else {
                            wrongcount++;
                            print(wrongcount);
                          }
                        });
                      }
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(ColorConstants.BLUE),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {
                  if (selectedIndex != null) {
                    if (currentQstnIndex < widget.qA!.length - 1) {
                      currentQstnIndex++;
                      selectedIndex = null;
                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              skipAnswer: skipCount,
                              wrongAnswers: wrongcount,
                              rightAnswerCount: rightAnswerCount,
                            ),
                          ));
                    }
                  } else {
                    if (currentQstnIndex < widget.qA!.length - 1) {
                      currentQstnIndex++;
                      skipCount++;
                      selectedIndex = null;
                      setState(() {});
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              skipAnswer: skipCount + 1,
                              wrongAnswers: wrongcount,
                              rightAnswerCount: rightAnswerCount,
                            ),
                          ));
                    }
                  }
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.MAINWHITE,
                      fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getColor(int index) {
    if (selectedIndex != null) {
      if (selectedIndex == widget.qA![currentQstnIndex]['answerIndex'] &&
          selectedIndex == index) {
        return ColorConstants.GREEN;
      } else if (selectedIndex != widget.qA![currentQstnIndex]['answerIndex'] &&
          selectedIndex == index) {
        return ColorConstants.RED;
      } else if (widget.qA![currentQstnIndex]['answerIndex'] == index) {
        return ColorConstants.GREEN;
      }
    }

    return ColorConstants.MAINGREY;
  }
}
