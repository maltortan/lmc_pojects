import 'package:flutter/material.dart';


class ProgressindicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator ProgressindicatorWidget - GROUP
    return Container(
        width: 60,
        height: 60,

        child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(255, 255, 255, 1),
                        border : Border.all(
                          color: Color.fromRGBO(158, 182, 163, 1),
                          width: 8,
                        ),
                        borderRadius : BorderRadius.all(Radius.elliptical(60, 60)),
                      )
                  )
              ),Positioned(
                  top: 4,
                  left: 3,
                  child: Container(
                      width: 51,
                      height: 51,
                      decoration: BoxDecoration(
                        color : Color.fromRGBO(217, 217, 217, 1),
                        border : Border.all(
                          color: Color.fromRGBO(70, 149, 87, 1),
                          width: 8,
                        ),
                        borderRadius : BorderRadius.all(Radius.elliptical(51, 51)),
                      )
                  )
              ),Positioned(
                  top: 16,
                  left: 15,
                  child: Text('65%', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'Roboto Serif',
                      fontSize: 14,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1
                  ),)
              ),
            ]
        )
    );
  }
}
