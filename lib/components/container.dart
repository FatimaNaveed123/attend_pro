import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress != null ? () => onPress!() : null,
      child: Container(
        margin: const EdgeInsets.all(30.0),
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(50),
        ),
        child: cardChild,
      ),
    );
  }
}
