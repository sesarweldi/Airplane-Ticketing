import 'package:airplane_bwa/cubit/auth_cubit.dart';
import 'package:airplane_bwa/cubit/destination_cubit.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/widget/destination_card.dart';
import 'package:airplane_bwa/ui/widget/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/destination_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestinations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: defaultMargin, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy,\n${state.user.name}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "Where to fly today?",
                          style: greyTextStyle.copyWith(
                              fontSize: 16, fontWeight: light),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/img_profile_dummy.png"))),
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

    Widget popularDestinations(List<DestinationModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations
                .map((DestinationModel data) =>
                    DestinationCard(destination: data))
                .toList(),
          ),
        ),
      );
    }

    Widget newDestination(List<DestinationModel> destinations) {
      return Container(
        margin: const EdgeInsets.only(
            top: 30, left: defaultMargin, right: defaultMargin, bottom: 140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Column(
              children: destinations
                  .map((DestinationModel data) =>
                      DestinationTile(destination: data))
                  .toList(),
            )
          ],
        ),
      );
    }

    return BlocConsumer<DestinationCubit, DestinationState>(
      listener: (context, state) {
        if (state is DestinationFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.error),
            backgroundColor: kRedColor,
          ));
        }
      },
      builder: (context, state) {
        if (state is DestintaionSuccess) {
          return ListView(
            children: [
              header(),
              popularDestinations(state.destinations),
              newDestination(state.destinations),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
