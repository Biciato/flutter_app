import 'package:flutter/material.dart';

class Utils {
  factory Utils() {
    return _instance;
  }

  Utils._internal();

  static final Utils _instance = Utils._internal();

  void openDialog(BuildContext context, String title, Widget content, String btn) =>
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user.png must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(title,
                    style: const TextStyle(
                      color: Colors.red,
                    ))),
            content: Row(
              children: <Widget>[
                Expanded(
                  child: content,
                )
              ],
            ),
            actions: <Widget>[
              FlatButton(
                  child: Text(btn), onPressed: () => Navigator.of(context).pop()),
            ],
          );
        },
      );
}