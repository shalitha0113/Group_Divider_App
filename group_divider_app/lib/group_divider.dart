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
                      backgroundColor: const Color.fromARGB(255, 148, 147, 146),
                      padding: const EdgeInsets.all(0.4),
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold)),
                  child: const Text('<')),
              const SizedBox(
                width: 40,
              ),
              const Text(
                'Member List',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ],
          ),
        ),
        body: const AddMemberBody(),
      ),
    );
  }
}

const beginAlignment = Alignment.topRight;
const endAlignment = Alignment.bottomLeft;

class AddMemberBody extends StatelessWidget {
  const AddMemberBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: beginAlignment,
              end: endAlignment,
              colors: [
            Color.fromARGB(255, 7, 255, 152),
            Color.fromARGB(255, 2, 80, 54)
          ])),
      child: const Center(child: AddMemberList()),
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
                                  fontSize: 18, fontWeight: FontWeight.bold)),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: memberList.isEmpty
                  ? const Column(children: [
                      SizedBox(height: 20),
                      Text("No Members Added!!")
                    ])
                  : DataTable(
                      headingRowHeight: 10,
                      columns: [
                        DataColumn(
                          label: Container(
                            alignment: Alignment.center,
                          ),
                        ),
                        const DataColumn(label: Text("")),
                      ],
                      rows: memberList
                          .map(
                            (name) => DataRow(
                              cells: [
                                DataCell(
                                  SizedBox(
                                    width: 160,
                                    child: Text(' $name'),
                                  ),
                                ),
                                DataCell(
                                  IconButton(
                                    icon: const Icon(Icons.delete),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 79, 89, 227),
                    foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                onPressed: addMemberOnPressed,
                child: const Text('Add Member'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 227, 79, 79),
                    foregroundColor: const Color.fromARGB(255, 229, 228, 235),
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                child: const Text('Clear the List'),
                onPressed: () {
                  setState(() {
                    memberList = [];
                  });
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          // const ElevatedButton(
          //     // onPressed: !isMembersEnough()
          //     //     ? null
          //     //     : () {
          //     //         memberList.shuffle();
          //     //         Navigator.push(
          //     //             context,
          //     //             MaterialPageRoute(
          //     //                 builder: (context) =>
          //     //                     GroupLists(memberList: memberList)
          //     //             )
          //     //         );
          //     //       },
          //     // child: const Text("Divide to Groups")
          //     ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
