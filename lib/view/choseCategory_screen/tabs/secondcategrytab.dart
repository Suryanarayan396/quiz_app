import 'package:flutter/material.dart';

class Secondcategrytab extends StatelessWidget {
  final String contimages;
  final String continames;
  const Secondcategrytab(
      {super.key, required this.contimages, required this.continames});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 150,
      decoration: BoxDecoration(
          color: Color(0xffd9d9d9),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              contimages,
              height: 85,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              continames,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      )),
    );
  }
}
