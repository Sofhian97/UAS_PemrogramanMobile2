import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/transaction_provider.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: Colors.amber,
          ),
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            headlineMedium: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            // Menggunakan headlineMedium sebagai pengganti headline6
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple),
              foregroundColor: MaterialStateProperty.all(Colors.white),
            ),
          ),
          appBarTheme: AppBarTheme(
            textTheme: TextTheme(
              headlineMedium: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionProvider = Provider.of<TransactionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: FutureBuilder(
        future: transactionProvider.fetchAndSetTransactions(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: <Widget>[
                  TransactionChart(transactionProvider.transactions),
                  Expanded(
                    child: TransactionList(transactionProvider.transactions),
                  ),
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }
}
