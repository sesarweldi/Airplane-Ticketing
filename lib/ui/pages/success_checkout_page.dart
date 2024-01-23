import 'package:airplane_bwa/cubit/page_cubit.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 80),
              width: 300,
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img_success.png"))),
            ),
            Text(
              "Well Booked 😍",
              style:
                  blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Are you ready to explore the new\nworld of experiences?",
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
              textAlign: TextAlign.center,
            ),
            CustomButton(
              title: "My Bookings",
              onPressed: () {
                context.read<PageCubit>().setPage(1);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/main", (route) => false);
              },
              width: 220,
              margin: const EdgeInsets.only(top: 50),
            )
          ],
        ),
      ),
    );
  }
}
