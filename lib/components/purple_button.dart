import 'package:flutter/material.dart';
import '../declaration/Constants/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({
    required this.onTap,
    required this.buttonTitle,
    required this.customeHeight,
    required this.customeWidth,
    required this.borderRadius,
  });
  final VoidCallback onTap;
  final String buttonTitle;
  final double customeWidth;
  final double customeHeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: customeWidth,
        height: customeHeight,
        decoration: BoxDecoration(
          color: bottomContainerColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        margin: EdgeInsets.only(top: 30.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: resultMsgTextStyle,
          ),
        ),
      ),
    );
  }
}
