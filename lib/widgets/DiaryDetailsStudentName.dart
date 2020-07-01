import 'package:flutter/material.dart';

class DiaryDetailsStudentName extends StatelessWidget {
  const DiaryDetailsStudentName(this._studentName);

  final String _studentName;

  @override
  Widget build(BuildContext context) =>
    ListTile(
      leading: const Icon(Icons.account_circle),
      title: Text(_studentName.toUpperCase())
    );
}