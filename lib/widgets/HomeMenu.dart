import 'package:aldeia_montessori/pages/MainPage.dart';
import 'package:flutter/material.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu(this._item, this._icon, this._index);

  final int _index;
  final String _item;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: () => Navigator.push<dynamic>(
          context,
          MaterialPageRoute<dynamic>(builder: (BuildContext context) => MainPage(_index))
        ),
        child: SizedBox(
          width: 114,
          height: 114,
          child: Card(
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(4.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Icon(_icon, size: 35)
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10, top: 5),
                    child: Text(_item)
                  )
                ]
              )
          )
        )
      );
  }
}