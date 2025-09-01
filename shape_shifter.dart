import 'package:flutter/material.dart';

enum ShapeType { square, circle, roundedBox }

class ShapeShifter extends StatefulWidget {
  const ShapeShifter({Key? key}) : super(key: key);

  @override
  State<ShapeShifter> createState() => _ShapeShifterState();
}

class _ShapeShifterState extends State<ShapeShifter> {
  ShapeType _currentShape = ShapeType.square;

  void _switchShape() {
    setState(() {
      _currentShape =
      ShapeType.values[(_currentShape.index + 1) % ShapeType.values.length];
    });
  }

  BorderRadius _getBorderRadius() {
    switch (_currentShape) {
      case ShapeType.square:
        return BorderRadius.zero;
      case ShapeType.circle:
        return BorderRadius.circular(1000);
      case ShapeType.roundedBox:
        return BorderRadius.circular(24);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Shape Shifter',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _switchShape,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: _getBorderRadius(),
            ),
            child: Center(
              child: Text(
                _currentShape.toString().split('.').last.toUpperCase(),
                style: const TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
