import 'package:airplane_bwa/cubit/auth_cubit.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_button.dart';
import '../widget/custom_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          "Sign In with your\nexisting account",
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
        ),
      );
    }

    Widget inputSection() {
      Widget submitButton() {
        return BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/main', (route) => false);
            } else if (state is AuthFailed) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ));
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return CustomButton(
                title: "Sign In",
                margin: const EdgeInsets.only(top: 10),
                onPressed: () => context.read<AuthCubit>().signIn(
                      email: emailController.text,
                      password: passwordController.text,
                    ));
          },
        );
      }

      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Column(
          children: [
            CustomTextFormField(
              controller: emailController,
              title: "Email Address",
              hintText: "Enter yout email",
              obsecureText: false,
            ),
            CustomTextFormField(
              controller: passwordController,
              title: "Password",
              hintText: "Enter your password",
              obsecureText: true,
            ),
            submitButton()
          ],
        ),
      );
    }

    Widget tacButton() {
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, "/sign-up"),
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 50, bottom: 73),
          child: Text(
            "Don't have an account? Sign Up",
            style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: light,
                decoration: TextDecoration.underline),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [title(), inputSection(), tacButton()],
        ),
      ),
    );
  }
}
