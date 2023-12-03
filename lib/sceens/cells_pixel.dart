import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../themes/colors.dart';

class CellPixel extends StatelessWidget {
  const CellPixel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlipCard(
        onFlip: () {},
        front: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: MainColor.buttomColor,
              borderRadius: BorderRadius.circular(2)),
        ),
        back: Container(
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
              color: Colors.grey[900], borderRadius: BorderRadius.circular(2)),
        ),
      ),
    );
  }
}
