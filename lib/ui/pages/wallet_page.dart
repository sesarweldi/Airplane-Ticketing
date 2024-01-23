import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';
import '../../shared/theme.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
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
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
