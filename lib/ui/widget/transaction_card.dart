import 'package:airplane_bwa/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'booking_details_info_item.dart';
import 'destination_tile.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: kWhiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DestinationTile(destination: transaction.destination),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Booking Details",
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 16,
          ),
          BookingDetailsInfoItem(
              title: "Traveler",
              valueColor: kBlackColor,
              valueText: "${transaction.amountOfTraveler} person"),
          BookingDetailsInfoItem(
              title: "Seat",
              valueColor: kBlackColor,
              valueText: transaction.selectedSeat),
          BookingDetailsInfoItem(
              title: "Insurance",
              valueColor: transaction.insurance ? kGreenColor : kRedColor,
              valueText: transaction.insurance ? "YES" : "NO"),
          BookingDetailsInfoItem(
              title: "Refundable",
              valueColor: transaction.refundable ? kGreenColor : kRedColor,
              valueText: transaction.refundable ? "YES" : "NO"),
          BookingDetailsInfoItem(
              title: "VAT",
              valueColor: kBlackColor,
              valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%"),
          BookingDetailsInfoItem(
              title: "Price",
              valueColor: kBlackColor,
              valueText: NumberFormat.currency(
                locale: "id",
                decimalDigits: 0,
                symbol: "IDR ",
              ).format(transaction.price)),
          BookingDetailsInfoItem(
              title: "Grand Total",
              valueColor: kPrimaryColor,
              valueText: NumberFormat.currency(
                locale: "id",
                decimalDigits: 0,
                symbol: "IDR ",
              ).format(transaction.grandTotal)),
        ],
      ),
    );
  }
}
