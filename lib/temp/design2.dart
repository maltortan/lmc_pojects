import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStatWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool status;
  final Color color;

  TextStatWidget({
    required this.label,
    required this.value,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding:
          EdgeInsets.symmetric(vertical: height * .01, horizontal: width * .02),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.white.withOpacity(0.8)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label.toUpperCase(),
                  style: GoogleFonts.tiroDevanagariHindi(
                    color: (status) ? Colors.black87 : Colors.black87,
                    fontSize: height * .022,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  SizedBox(
                    width: width * .6,
                    child: Text(value,
                        softWrap: true,
                        maxLines: 3,
                        style: GoogleFonts.tiroDevanagariHindi(
                          color: (status) ? Colors.black : Colors.black,
                          fontSize: height * .03,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(width: 4),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (status)
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              (status) ? Icons.check : Icons.close,
              color: (status) ? Colors.green : Colors.red,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
