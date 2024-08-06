import 'package:flutter/material.dart';
import 'package:quiz_app/utils/constants/color_constants.dart';

class OptionsCard extends StatelessWidget {
  const OptionsCard({
    super.key,
    required this.options,
    this.onTap,
    this.borderColor,
  });
  final String options;
  final void Function()? onTap;
  final Color? borderColor;
  // final bool isRight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                options,
                style: TextStyle(color: ColorConstants.MAINWHITE, fontSize: 14),
              ),
            ),
            Spacer(),
            Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorConstants.MAINWHITE)),
            )
          ],
        ),
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: borderColor ?? ColorConstants.MAINGREY)),
      ),
    );
  }
}
