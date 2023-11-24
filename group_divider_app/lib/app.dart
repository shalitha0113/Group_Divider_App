import 'package:flutter/material.dart';
import 'package:group_divider_app/home.dart';


class GroupDividerApp extends StatelessWidget {
  const GroupDividerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Scaffold(
      //     appBar: AppBar(
      //       backgroundColor: const Color.fromARGB(255, 148, 147, 146),
      //       title: const Text('Group Divider '),
      //       titleTextStyle: const TextStyle(fontSize: 28),
      //       centerTitle: true,
      //     ),
      //     body: const GradientContrainer(colors :[ Color.fromARGB(255, 7, 255, 152),
      //   Color.fromARGB(255, 2, 80, 54)])),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage()
      },
    );
  }
}
