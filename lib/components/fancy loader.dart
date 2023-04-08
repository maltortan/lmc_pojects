import 'dart:math';

import 'package:flutter/material.dart';

class LinearFancyLoader extends StatefulWidget {
  @override
  _LinearFancyLoaderState createState() => _LinearFancyLoaderState();
}

class _LinearFancyLoaderState extends State<LinearFancyLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    )..repeat();
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey[300],
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return ClipPath(
                    clipper: LinearClipper(_animation.value),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 200.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue,
                            Colors.blueAccent,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: 200.0,
              height: 40.0,
              child: Center(
                child: Text(
                  'LOADING',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinearClipper extends CustomClipper<Path> {
  final double progress;

  LinearClipper(this.progress);

  @override
  Path getClip(Size size) {
    Path path = Path();
    double radius = size.height / 2;
    double width = size.width - radius * 2;
    double centerX = radius + width * progress;
    double centerY = radius;

    path.addArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -0.5 * pi,
      2 * pi,
    );
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(centerX + radius, size.height);
    path.addArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      0.5 * pi,
      2 * pi,
    );
    path.lineTo(radius, size.height);
    path.addArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -0.5 * pi,
      2 * pi,
    );
    path.lineTo(0.0, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
