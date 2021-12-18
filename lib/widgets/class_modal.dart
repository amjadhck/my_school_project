import 'package:flutter/material.dart';

class VerticalHight extends StatelessWidget {
  final double value;

  const VerticalHight({required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class HorizontalHight extends StatelessWidget {
  final double value;

  const HorizontalHight({required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
