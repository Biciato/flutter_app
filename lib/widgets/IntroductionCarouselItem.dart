import 'package:flutter/material.dart';

class IntroductionCarouselItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 240,
          child: const Image(
            image: AssetImage('assets/instructions.png'),
            fit: BoxFit.fill
          )
        ),
        Container(
          margin: const EdgeInsets.all(5),
          child: const Text(
            'Lorem ipsum dolor',
            style: TextStyle(fontSize: 18)
          )
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(30, 5, 30, 0),
          child: const Text(
            'Lorem ipsum dolor sit amet, consecteur adipiscing elit linquam enim quam ullamcorper.',
            textAlign: TextAlign.center
          )
        )
      ]
    );
  }
}