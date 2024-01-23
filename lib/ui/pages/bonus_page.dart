import 'package:airplane_bwa/cubit/auth_cubit.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_button.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Text(
        "Big Bonus 🎉",
        style: blackTextStyle.copyWith(fontSize: 32, fontWeight: semiBold),
      );
    }

    Widget subtitle() {
      return Text(
        "We give you early credit so that\nyou can buy a flight ticket",
        style: greyTextStyle.copyWith(fontSize: 16, fontWeight: light),
        textAlign: TextAlign.center,
      );
    }

    Widget startButton() {
      return CustomButton(
        title: "Start Fly Now",
        width: 220,
        margin: const EdgeInsets.only(top: 50),
        onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context, "/main", (route) => false),
      );
    }

    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              width: 300,
              height: 211,
              padding: const EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage("assets/img_card.png")),
                  boxShadow: [
                    BoxShadow(
                        color: kPrimaryColor.withOpacity(0.5),
                        blurRadius: 50,
                        offset: const Offset(0, 10)),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: whiteTextStyle.copyWith(
                                  fontSize: 14, fontWeight: light),
                            ),
                            Text(
                              state.user.name,
                              style: whiteTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: medium,
                              ),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 24,
                        height: 24,
                        margin: const EdgeInsets.only(right: 6),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/ic_plane.png"))),
                      ),
                      Text(
                        "Pay",
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: medium),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Balance",
                    style: whiteTextStyle.copyWith(fontWeight: light),
                  ),
                  Expanded(
                    child: Text(
                      state.user.balance.toString(),
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 26),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            const SizedBox(
              height: 50,
            ),
            title(),
            const SizedBox(
              height: 10,
            ),
            subtitle(),
            startButton()
          ],
        ),
      ),
    );
  }
}
