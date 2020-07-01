import 'package:flutter/material.dart';

class HomeNews extends StatelessWidget {
  const HomeNews(this._width);

  final double _width;

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: _width,
        child: Card(
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(4.0)
          ),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 10, top: 15),
                child: const Text('Lorem ipsum dolor [título]', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18))
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(9),
                    width: 100,
                    height: 100,
                    child: const Image(
                      width: 100,
                      height: 100,
                      image: AssetImage('assets/logo-aldeia.png')
                    )
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    width: 162,
                    height: 100,
                    child: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit liquam. [resumo]')
                  )
                ]
              )
            ]
          )
        )
      );
  }
}