import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class Rating extends StatelessWidget {
  final double ratingValue;

  const Rating({super.key, required this.ratingValue});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 6, bottom: 6),
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/ic_star.png"))),
          ),
          Text(
            ratingValue.toString(),
            style: blackTextStyle.copyWith(fontWeight: medium),
          )
        ]);
  }
}
