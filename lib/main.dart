import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';
import 'package:flutter_complete_guide/widgets/IconPlusButton.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';
import 'models/transaction.dart';

import 'widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expenses Counter',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      builder: (_) {
        print('function trigered');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:18 ),
          child: NewTransaction(
            getTransactionList: _addNewTransaction,
            mediaQuery: MediaQuery.of(ctx),
          ),
        );
      },
    );
  }

  /*List whitch will be passed to the transaction list constructor*/
  static final List<Transaction> _listTransactions = [
    Transaction(amount: 155.00, date: DateTime.now(), id: 't1', title: 'shoes'),
    Transaction(amount: 122, date: DateTime.now(), id: 't2', title: 'golf')
  ];

  /*List of transaction this week to pass to the chard constructor*/
  List<Transaction> get _currentListTransactions {
    return _listTransactions.where((element) {
      print('_listTransactions called');
      /*add only this which hapanned to 7 dayes ago */
      return element.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  /*to lift stateUp From new_transaction to add one*/
  int indexId = 1;

  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    var tmpTx = Transaction(
        amount: txAmount,
        title: txTitle,
        date: date,
        id: 'transaction: $indexId');
    indexId++;
    setState(() {
      _listTransactions.add(tmpTx);
    });
    Navigator.of(context).pop();
  }

  /*to lift stateUp From new_transaction to delete one*/
  void _deleteTransaction(String id) {
    setState(
      () {
        _listTransactions.removeWhere((element) => element.id == id);
      },
    );
  }

  bool chartOn = true;


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;

    return Container(
      decoration: kBoxLinearGradient,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(decoration: kBoxLinearGradient),
          actions: [
            Container(
              margin: EdgeInsets.only(right: width * 0.0342),
              child: IconPlusButton(
                callBack: () => startAddNewTransaction(context),
                iconSize: height * 0.0256,
              ),
            )
          ],
          title: Center(
            child: Text(
              'Expenses Counter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /*reendering different depending on the orientation*/
              if (mediaQuery.orientation == Orientation.portrait)
                Chart(
                  listOfTransactionl: _currentListTransactions,
                ),
              if (mediaQuery.orientation == Orientation.portrait)
                TransactionList(
                  lfDeleteTransaction: _deleteTransaction,
                  listTransactions: _listTransactions,
                ),
              if (mediaQuery.orientation == Orientation.landscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Chart'),
                    Switch(
                        value: chartOn,
                        onChanged: (value) {
                          setState(() {
                            chartOn = value;
                          });
                          print(chartOn);
                        })
                  ],
                ),
              if (mediaQuery.orientation == Orientation.landscape)
                chartOn
                    ? Chart(
                        listOfTransactionl: _currentListTransactions,
                      )
                    : TransactionList(
                        lfDeleteTransaction: _deleteTransaction,
                        listTransactions: _listTransactions,
                      ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: height * 0.0256),
          child: IconPlusButton(
            callBack: () => startAddNewTransaction(context),
            iconSize: height * 0.0384,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
