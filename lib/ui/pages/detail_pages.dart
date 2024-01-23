import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/pages/choose_seat_page.dart';
import 'package:airplane_bwa/ui/widget/custom_button.dart';
import 'package:airplane_bwa/ui/widget/interest_detail_item.dart';
import 'package:airplane_bwa/ui/widget/photo_detail_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/destination_model.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel? destination;

  const DetailPage({this.destination, super.key});

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: 450,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(destination?.imageUrl ?? ""))),
      );
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 224,
        margin: const EdgeInsets.only(top: 226),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.95)
            ])),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(children: [
          // NOTE: Emblem
          Container(
            width: 108,
            height: 24,
            margin: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/ic_emblem.png"))),
          ),

          //Note Title
          Container(
            margin: const EdgeInsets.only(top: 256),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination?.name ?? "",
                        style: whiteTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: semiBold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        destination?.city ?? "",
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 6, bottom: 6),
                      width: 20,
                      height: 20,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/ic_star.png"))),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      destination?.rating.toString() ?? "0.0",
                      style: whiteTextStyle.copyWith(fontWeight: medium),
                    )
                  ],
                ),
              ],
            ),
          ),

          //NOTE: DESCRIPTION
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                color: kWhiteColor, borderRadius: BorderRadius.circular(18)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // NOTE: ABOUT
                Text(
                  "About",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.",
                  style: blackTextStyle.copyWith(height: 2),
                ),

                //NOTE: PHOTOS
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Photos",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    PhotoDetailItem(imageUrl: "assets/img_detail_photo1.png"),
                    PhotoDetailItem(imageUrl: "assets/img_detail_photo2.png"),
                    PhotoDetailItem(imageUrl: "assets/img_detail_photo3.png"),
                  ],
                ),

                // Note: INTEREST
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Interest",
                  style:
                      blackTextStyle.copyWith(fontWeight: bold, fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Row(
                  children: [
                    InterestDetailItem(title: "Kids Park"),
                    InterestDetailItem(title: "Honor Bridge"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    InterestDetailItem(title: "City Museum"),
                    InterestDetailItem(title: "Central Mall"),
                  ],
                ),

                //NOTE: PRICE AND BOOK BUTTON
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  child: Row(children: [
                    //PRICE
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            NumberFormat.currency(
                                    locale: "id",
                                    symbol: "IDR ",
                                    decimalDigits: 0)
                                .format(destination?.price),
                            style: blackTextStyle.copyWith(
                                fontWeight: medium, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "per Orang",
                            style: greyTextStyle.copyWith(fontWeight: light),
                          )
                        ],
                      ),
                    ),

                    //BOOK BUTTON
                    CustomButton(
                      title: "Book Now",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChooseSeatPage(destination: destination),
                            ));
                      },
                      width: 170,
                    )
                  ]),
                )
              ],
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [backgroundImage(), customShadow(), content()],
        ),
      ),
    );
  }
}
