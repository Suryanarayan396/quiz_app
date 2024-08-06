import 'package:flutter/material.dart';
import 'package:quiz_app/dummy_db.dart';
import 'package:quiz_app/view/choseCategory_screen/tabs/secondcategrytab.dart';

class Categorychoose extends StatelessWidget {
  const Categorychoose({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("data"),
            Text("data"),
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              alignment: Alignment.bottomCenter,
              child: Center(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: DummyDb.categorylist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) => Secondcategrytab(
                      contimages:
                          DummyDb.categorylist[index]["imagepath"].toString(),
                      continames:
                          DummyDb.categorylist[index]["title"].toString()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
