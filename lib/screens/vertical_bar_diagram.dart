import 'package:flutter/material.dart';

class VerticalBarDiagram extends StatefulWidget {
  final List<double> values;
  final List<Color> colors;
  final double height;
  final double width;
  final double maxValue;

  VerticalBarDiagram(
      {required this.values,
        required this.colors,
        required this.height,
        required this.width,
        required this.maxValue});

  @override
  _VerticalBarDiagramState createState() => _VerticalBarDiagramState();
}

class _VerticalBarDiagramState extends State<VerticalBarDiagram> {
  late List<double> _currentValues;

  @override
  void initState() {
    super.initState();
    _currentValues = List.generate(widget.values.length, (index) => 0.0);
  }

  @override
  void didUpdateWidget(VerticalBarDiagram oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.values != widget.values) {
      setState(() {
        _currentValues = List.generate(widget.values.length, (index) => 0.0);
        _animateToValue();
      });
    }
  }

  void _animateToValue() {
    for (int i = 0; i < widget.values.length; i++) {
      setState(() {
        _currentValues[i] = widget.values[i];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          widget.values.length,
              (index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 2500),
                  width: widget.width / (widget.values.length * 1.5),
                  height: widget.height * (_currentValues[index] / widget.maxValue)*.8,
                  decoration: BoxDecoration(
                    color: widget.colors[index],
                  ),
                ),
                SizedBox(height: 10),

              ],
            );
          },
        ),
      ),
    );
  }
}
