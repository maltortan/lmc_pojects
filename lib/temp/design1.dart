import 'package:flutter/material.dart';

class KnifeRibbonContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color color;

  KnifeRibbonContainer({
    required this.height,
    required this.width,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2500,
      width: 6000,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(height / 2),
          topRight: Radius.circular(height / 2),
          bottomLeft: Radius.circular(height / 2),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: height,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(height / 2),
                  bottomRight: Radius.circular(height / 2),
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
