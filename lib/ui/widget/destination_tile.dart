import 'package:airplane_bwa/models/destination_model.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/widget/rating.dart';
import 'package:flutter/material.dart';

import '../pages/detail_pages.dart';

class DestinationTile extends StatelessWidget {
  final DestinationModel destination;

  const DestinationTile({super.key, required this.destination});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    destination: destination,
                  ))),
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(destination.imageUrl),
                  )),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(fontWeight: light),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 32,
            ),
            Rating(ratingValue: destination.rating)
          ],
        ),
      ),
    );
  }
}
