import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: <Widget>[
              Text(
                'Transaksi Belum Ada',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transactions[index]);
            },
            itemCount: transactions.length,
          );
  }
}
