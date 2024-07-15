import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionProvider with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions {
    return [..._transactions];
  }

  void addTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );
    _transactions.add(newTx);
    notifyListeners();
  }

  Future<void> fetchAndSetTransactions() async {
    // Implementasi untuk mengambil data dari RESTful API
  }
}
