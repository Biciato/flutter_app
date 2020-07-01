import 'package:flutter/material.dart';

class DiaryDetailsScopeTitle extends StatelessWidget {
  const DiaryDetailsScopeTitle(this._scopeTitle);

  final String _scopeTitle;
  @override
  Widget build(BuildContext context) =>
    Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        child: Text(_scopeTitle, style: const TextStyle(fontSize: 20))
    );

}