import 'package:flutter/material.dart';

class Bar {
  final String label;
  late final double value;

  Bar({required this.label, required this.value});
}

class BarDiagramScreen extends StatefulWidget {
  @override
  _BarDiagramScreenState createState() => _BarDiagramScreenState();
}

class _BarDiagramScreenState extends State<BarDiagramScreen> {
  final List<Bar> bars = [
    Bar(label: "Bar 1", value: 0.3),
    Bar(label: "Bar 2", value: 0.6),
    Bar(label: "Bar 3", value: 0.8),
    Bar(label: "Bar 4", value: 0.4),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: bars.map((bar) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    bar.value += 0.1;
                    if (bar.value > 1.0) {
                      bar.value = 0.0;
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * bar.value,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    bar.label,
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
