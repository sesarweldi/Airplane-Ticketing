import 'package:airplane_bwa/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  //NOTE: 0: Available, 1: Selected, 2:Unavailable

  final String id;
  final bool isAvailable;

  const SeatItem({super.key, this.isAvailable = true, required this.id});

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    borderColor() {
      if (!isAvailable) {
        return kUnavailableColor;
      } else {
        if (isSelected) {
          return kPrimaryColor;
        } else {
          return kAvailableColor;
        }
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child:
              Text("YOU", style: whiteTextStyle.copyWith(fontWeight: semiBold)),
        );
      } else {
        const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
              color: backgroundColor(),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: borderColor(), width: 2)),
          child: child()),
    );
  }
}
