import 'package:flutter/material.dart';

const beginAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

class GradientContrainer extends StatelessWidget {
  const GradientContrainer({super.key, required this.colors});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: beginAlignment,end: endAlignment ,colors: colors)),
    );
  }
}
