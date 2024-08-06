import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/utils/constants/color_constants.dart';
import 'package:quiz_app/view/choseCategory_screen/tabs/categoryTab.dart';
import 'package:quiz_app/view/home_screen/home_screen.dart';

class ChosecategoryScreen extends StatelessWidget {
  const ChosecategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.MAINBLACK,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: ColorConstants.RED,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "It's Quiz Time",
                  style: TextStyle(
                      color: ColorConstants.MAINWHITE,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 280,
                    crossAxisSpacing: 10,
                    crossAxisCount: 2),
                itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HomeScreen(qA: DummyDb.question[index]),
                          ));
                    },
                    child: CategoryTab(
                      url: DummyDb.categorylist[index]['imagepath'],
                      title: DummyDb.categorylist[index]['title'],
                      word: DummyDb.categorylist[index]['word'],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
