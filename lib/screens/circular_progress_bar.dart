import 'package:development_status/components/convert_nepali.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircularProgressBar extends StatefulWidget {
  final double percentage;

  CircularProgressBar({required this.percentage});

  @override
  _CircularProgressBarState createState() => _CircularProgressBarState();
}

class _CircularProgressBarState extends State<CircularProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: widget.percentage / 100)
        .animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        height: height*.1,
        width: height*.1,
        child: Stack(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],

              ),
            ),
            Center(
              child: Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: (Colors.grey[500])!,
                      offset: Offset(0, 5),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Center(
                  child: Text(

                    "${convertToNepali(widget.percentage.toString())}%",
                    style: GoogleFonts.tiroDevanagariHindi(
                        fontWeight: FontWeight.bold,
                        fontSize: width*.015,
                      color: Colors.grey[600],
                    )

                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: CustomPaint(
                painter: ProgressPainter(value: _animation.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double value;

  ProgressPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..color = Colors.blue;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - paint.strokeWidth) / 2;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -90 * (3.14 / 180),
      360 * value * (3.14 / 180),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
