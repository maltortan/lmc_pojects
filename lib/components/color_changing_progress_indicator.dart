import 'package:flutter/material.dart';

class ColorChangingLoadingIndicator extends StatefulWidget {
  final List<String> texts;

  ColorChangingLoadingIndicator({required this.texts});

  @override
  _ColorChangingLoadingIndicatorState createState() =>
      _ColorChangingLoadingIndicatorState();
}

class _ColorChangingLoadingIndicatorState
    extends State<ColorChangingLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Color> _colors;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    _colors = List.generate(widget.texts.length, (index) => Colors.grey);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.texts.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (_colors[index] == Colors.grey) {
                _colors[index] = Colors.red;
              } else if (_colors[index] == Colors.red) {
                _colors[index] = Colors.yellow;
              } else {
                _colors[index] = Colors.green;
              }
              return Text(
                widget.texts[index],
                style: TextStyle(
                  color: _colors[index],
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
