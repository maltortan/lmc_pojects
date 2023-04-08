import 'dart:ui';

import 'package:development_status/components/convert_nepali.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:google_fonts/google_fonts.dart';

class ShortTextCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final double borderRadius;

  ShortTextCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.borderRadius = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width*.45,
      padding: EdgeInsets.only(left: width*.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),


      ),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Row(
              children: [
                Transform.rotate(
                  angle: -math.pi / 4,
                  child: Container(
                    width: width*.04,
                    height: width*.04,
                    padding: EdgeInsets.all(width*.01),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset('assets/icon/'+icon, color: Colors.white,
                  )

                  ),
                ),
                SizedBox(width: width*.02),
                Text(
                  title,
                  style: GoogleFonts.tiroDevanagariHindi(
                    fontWeight: FontWeight.bold,
                    fontSize: width*.020
                  )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: width*.01),
              child: Text(
                convertToNepali(subtitle),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: width*.020,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoColumnCardLayout extends StatelessWidget {
  final List<ShortTextCard> cards;

  TwoColumnCardLayout({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: cards
                .sublist(0, (cards.length / 2).ceil())
                .map((card) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: card,
            ))
                .toList(),
          ),
        ),
        Expanded(
          child: Column(
            children: cards
                .sublist((cards.length / 2).ceil())
                .map((card) => Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: card,
            ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
