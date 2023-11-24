import 'package:flutter/material.dart';
import 'package:group_divider_app/group_divider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGroupDivied = false;
  @override
  Widget build(BuildContext context) {
    return isGroupDivied
        ? Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const GroupDivider(),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isGroupDivied = false;
                  });
                },
                child: const Text(
                  'Back to Home',
                  style: TextStyle(color: Colors.blue, fontSize: 25),
                ),
              )
            ],
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 70),
                child: const Text(
                  'Welcome to Group Divider App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                'assets/images/GD_1.png',
                width: 350,
                height: 300,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GroupDivider()));
                  },
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  child: const Text("Start Group Divide"))
            ],
          );
  }
}
