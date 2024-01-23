import 'package:airplane_bwa/cubit/page_cubit.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/pages/home_page.dart';
import 'package:airplane_bwa/ui/pages/setting_page.dart';
import 'package:airplane_bwa/ui/pages/transaction_page.dart';
import 'package:airplane_bwa/ui/pages/wallet_page.dart';
import 'package:airplane_bwa/ui/widget/custom_button_bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const TransactionPage();
        case 2:
          return const WalletPage();
        case 3:
          return const SettingPage();
        default:
          return const HomePage();
      }
    }

    Widget customBottomNavbar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: const EdgeInsets.only(
              right: defaultMargin, left: defaultMargin, bottom: 30),
          decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: kBlackColor.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(5, 5)),
              ]),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtonNavItem(
                index: 0,
                imageUrl: "assets/ic_menu_home.png",
              ),
              CustomButtonNavItem(
                index: 1,
                imageUrl: "assets/ic_menu_booking.png",
              ),
              CustomButtonNavItem(
                index: 2,
                imageUrl: "assets/ic_menu_payment.png",
              ),
              CustomButtonNavItem(
                index: 3,
                imageUrl: "assets/ic_menu_settings.png",
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [buildContent(currentIndex), customBottomNavbar()],
          ),
        );
      },
    );
  }
}
