import 'package:airplane_bwa/cubit/transaction_cubit.dart';
import 'package:airplane_bwa/shared/theme.dart';
import 'package:airplane_bwa/ui/widget/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransaction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (context, state) {
          if (state is TransactionLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionSuccess) {
            if (state.transaction.isEmpty) {
              return const Center(
                child: Text("km belum transaks!i"),
              );
            } else {
              return ListView.builder(
                  itemCount: state.transaction.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultMargin),
                  itemBuilder: (context, index) {
                    return TransactionCard(state.transaction[index]);
                  });
            }
          }
          return const Center(
            child: Text("Transaction Page"),
          );
        },
      ),
    );
  }
}
