import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class BookingDetailsInfoItem extends StatelessWidget {
  final String title;
  final String valueText;
  final Color valueColor;

  const BookingDetailsInfoItem(
      {super.key,
      required this.title,
      required this.valueColor,
      required this.valueText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 6),
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/ic_check.png"))),
            ),
            Text(
              title,
              style: blackTextStyle,
            ),
          ],
        ),
        SizedBox(
          width: 80,
        ),
        Flexible(
          child: Text(
            valueText,
            style: blackTextStyle.copyWith(
                fontWeight: semiBold, color: valueColor),
          ),
        ),
      ]),
    );
  }
}
