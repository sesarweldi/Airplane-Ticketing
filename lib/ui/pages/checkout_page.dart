import 'package:airplane_bwa/cubit/auth_cubit.dart';
import 'package:airplane_bwa/cubit/transaction_cubit.dart';
import 'package:airplane_bwa/models/destination_model.dart';
import 'package:airplane_bwa/models/transaction_model.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/widget/booking_details_info_item.dart';
import 'package:airplane_bwa/ui/widget/custom_button.dart';
import 'package:airplane_bwa/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel? transaction;

  const CheckoutPage({this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img_checkout.png"))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Tangerang",
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: light),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: semiBold),
                    ),
                    Text(
                      "Ciliwung",
                      style: greyTextStyle.copyWith(
                          fontSize: 16, fontWeight: light),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DestinationTile(
                destination: transaction?.destination ??
                    const DestinationModel(id: "0")),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Booking Details",
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 16,
            ),
            BookingDetailsInfoItem(
                title: "Traveler",
                valueColor: kBlackColor,
                valueText: "${transaction?.amountOfTraveler} person"),
            BookingDetailsInfoItem(
                title: "Seat",
                valueColor: kBlackColor,
                valueText: transaction?.selectedSeat ?? ""),
            BookingDetailsInfoItem(
                title: "Insurance",
                valueColor:
                    transaction?.insurance ?? false ? kGreenColor : kRedColor,
                valueText: transaction?.insurance ?? false ? "YES" : "NO"),
            BookingDetailsInfoItem(
                title: "Refundable",
                valueColor:
                    transaction?.refundable ?? false ? kGreenColor : kRedColor,
                valueText: transaction?.refundable ?? false ? "YES" : "NO"),
            BookingDetailsInfoItem(
                title: "VAT",
                valueColor: kBlackColor,
                valueText:
                    "${((transaction?.vat ?? 0) * 100).toStringAsFixed(0)}%"),
            BookingDetailsInfoItem(
                title: "Price",
                valueColor: kBlackColor,
                valueText: NumberFormat.currency(
                  locale: "id",
                  decimalDigits: 0,
                  symbol: "IDR ",
                ).format(transaction?.price)),
            BookingDetailsInfoItem(
                title: "Grand Total",
                valueColor: kPrimaryColor,
                valueText: NumberFormat.currency(
                  locale: "id",
                  decimalDigits: 0,
                  symbol: "IDR ",
                ).format(transaction?.grandTotal)),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                        fontSize: 16, fontWeight: semiBold),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 70,
                        width: 100,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/img_card.png"))),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 6),
                                width: 24,
                                height: 24,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage("assets/ic_plane.png"))),
                              ),
                              Text(
                                "Pay",
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: "id",
                                decimalDigits: 0,
                                symbol: "IDR ",
                              ).format(state.user.balance),
                              style: blackTextStyle.copyWith(
                                  fontSize: 18, fontWeight: medium),
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Current Balance",
                              style: greyTextStyle.copyWith(fontWeight: light),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      );
    }

    Widget payNowButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, "/success-checkout", (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: kRedColor,
            ));
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
            title: "Pay Now",
            onPressed: () => context
                .read<TransactionCubit>()
                .createTransaction(transaction!),
            margin: const EdgeInsets.only(top: 30),
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        child: Text(
          "Terms and Conditions",
          style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payNowButton(),
            tacButton()
          ],
        ),
      ),
    );
  }
}
