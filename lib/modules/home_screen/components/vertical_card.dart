import 'dart:math';

import 'package:flutter/material.dart';

class VerticalCard extends StatelessWidget {
  const VerticalCard({Key? key}) : super(key: key);

//get random colors
  Color getRandomColor() {
    return Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255),
        Random().nextInt(255));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: getRandomColor(),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
