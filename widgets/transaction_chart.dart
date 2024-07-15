import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  TransactionChart(this.recentTransactions);

  List<BarChartGroupData> get barGroups {
    return recentTransactions.map((tx) {
      return BarChartGroupData(
        x: recentTransactions.indexOf(tx),
        barRods: [
          BarChartRodData(
            y: tx.amount,
            colors: [Colors.blue],
            width: 15,
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: BarChart(
          BarChartData(
            borderData: FlBorderData(show: false),
            titlesData: FlTitlesData(show: false),
            barGroups: barGroups,
          ),
        ),
      ),
    );
  }
}
