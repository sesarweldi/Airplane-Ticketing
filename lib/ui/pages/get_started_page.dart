import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/widget/custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/bg_get_started.png"))),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Fly Like a Bird",
                  style: whiteTextStyle.copyWith(
                      fontSize: 32, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Explore new world with us and let \nyourself get an amazing experiences",
                  style:
                      whiteTextStyle.copyWith(fontSize: 16, fontWeight: light),
                  textAlign: TextAlign.center,
                ),
                CustomButton(
                  title: "Get Started",
                  onPressed: () => Navigator.pushNamed(context, "/sign-up"),
                  margin: const EdgeInsets.only(top: 50, bottom: 80),
                  width: 220,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
