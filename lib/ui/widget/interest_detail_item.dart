import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class InterestDetailItem extends StatelessWidget {
  final String title;

  const InterestDetailItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: const EdgeInsets.only(right: 6),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ic_check.png"),
                    fit: BoxFit.cover)),
          ),
          Text(
            title,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
