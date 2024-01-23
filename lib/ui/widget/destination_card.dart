import 'package:airplane_bwa/models/destination_model.dart';
import 'package:airplane_bwa/ui/pages/detail_pages.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class DestinationCard extends StatelessWidget {
  final DestinationModel destination;

  const DestinationCard({
    required this.destination,
    super.key,
  });

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
        width: 200,
        height: 323,
        margin: const EdgeInsets.only(left: defaultMargin),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(destination.imageUrl)),
                  borderRadius: BorderRadius.circular(18)),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 54,
                  height: 30,
                  decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(18))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 6, bottom: 6),
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ic_star.png"))),
                      ),
                      Text(
                        destination.rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.name,
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                  ),
                  Text(
                    destination.city,
                    style: greyTextStyle.copyWith(fontWeight: light),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
