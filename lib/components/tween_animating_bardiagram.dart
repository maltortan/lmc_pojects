import 'package:flutter/material.dart';

class TweenAnimationBarDiagram extends StatefulWidget {
final List<double> barValues;
final List<Color> colors;
TweenAnimationBarDiagram({required this.barValues,
  required this.colors,} );
  @override
  _TweenAnimationBarDiagramState createState() => _TweenAnimationBarDiagramState();
}

class _TweenAnimationBarDiagramState extends State<TweenAnimationBarDiagram> with TickerProviderStateMixin {
  late AnimationController _animationController;

  List<Animation<double>> _barAnimations = [];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2500),
    );

    for (int i = 0; i < widget.barValues.length; i++) {
      _barAnimations.add(
        Tween<double>(
          begin: 0.0,
          end: widget.barValues[i],
        ).animate(CurvedAnimation(
          parent: _animationController,
          curve: Interval((i + 1) / widget.barValues.length, 1.0, curve: Curves.easeInOut),
        )),
      );
    }

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;
    return  Container(
      height: height*.25,
      width: width*.1,
      child: Stack(
        children: List.generate(
          _barAnimations.length,
              (index) => AnimatedBuilder(
            animation: _barAnimations[index],
            builder: (context, child) => Positioned(
              bottom: 0,
              left: index * width*.022,
              width: width*.02,
              height: _barAnimations[index].value*180,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.colors[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
