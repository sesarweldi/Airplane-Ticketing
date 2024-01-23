import 'package:airplane_bwa/models/transaction_model.dart';
import 'package:airplane_bwa/services/transaction_serice.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(const TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(error: e.toString()));
    }
  }

  void fetchTransaction() async {
    try {
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction();
      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(error: e.toString()));
    }
  }
}
