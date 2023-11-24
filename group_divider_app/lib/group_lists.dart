import 'package:flutter/material.dart';

class GroupsList extends StatefulWidget {
  final List<String> memberList;
  const GroupsList({super.key, required this.memberList});

  @override
  State<GroupsList> createState() => _GroupsListState();
}

class _GroupsListState extends State<GroupsList> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
