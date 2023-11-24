import 'package:flutter/material.dart';
import 'package:group_divider_app/home.dart';

const beginAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

class GradientContrainer extends StatelessWidget {
  const GradientContrainer({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(begin: beginAlignment,end: endAlignment ,colors: [ Color.fromARGB(255, 7, 255, 152),
        Color.fromARGB(255, 2, 80, 54)])),
      child: const Center(child:  HomePage()),
    );
  }
}
