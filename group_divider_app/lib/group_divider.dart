import 'package:flutter/material.dart';
import 'package:group_divider_app/home.dart';

class GroupDivider extends StatefulWidget {
  const GroupDivider({super.key});

  @override
  State<GroupDivider> createState() => _GroupDividerState();
}

class _GroupDividerState extends State<GroupDivider> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 148, 147, 146),
          title: Row(
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage())),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  child: const Text('<')),
              const SizedBox(
                width: 10,
              ),
              const Text('Member List'),
              ElevatedButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddMemberList())),
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blueGrey,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  child: const Text('+')),
            ],
          ),
        ),
        body: const AddMemberList(),
      ),
    );
  }
}

class AddMemberList extends StatefulWidget {
  const AddMemberList({super.key});

  @override
  State<AddMemberList> createState() => _AddMemberListState();
}

class _AddMemberListState extends State<AddMemberList> {
  List<String> memberList = [];
  bool showWarningMeg = false;
  final TextEditingController _addMemberController = TextEditingController();

  void addMemberOnPressed() {
    showAddMemberDialog();
  }

  void showAddMemberDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Members'),
            content: SizedBox(
              width: 200,
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                      controller: _addMemberController,
                      decoration:
                          const InputDecoration(hintText: 'Enter Name')),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            if (_addMemberController.text != "") {
                              memberList.add(_addMemberController.text);
                              setState(() {
                                _addMemberController.text = "";
                                showWarningMeg = false;
                              });
                            } else {
                              setState(() {
                                showWarningMeg = true;
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                  const Color.fromARGB(255, 231, 99, 43),
                              foregroundColor:
                                  const Color.fromARGB(255, 229, 228, 235),
                              textStyle: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)
                          ),
                          child: const Text('Add')),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Close')),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
