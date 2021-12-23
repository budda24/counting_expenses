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
      builder: (_) {
        print('function trigered');
        return NewTransaction(
          getTransactionList: _addNewTransaction,
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
/*  void _deleteTransaction(String id) {
    setState(
      () {
        _listTransactions.removeWhere((element) => element.id == id);
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxLinearGradient,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(decoration: kBoxLinearGradient),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: IconPlusButton(
                callBack: () => startAddNewTransaction(context),
                iconSize: 20,
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
              /*Chart(listOfTransactionl: _listTransactions),*/
              Chart(
                listOfTransactionl: _currentListTransactions,
              ),
              TransactionList(
                /*lfDeleteTransaction: _deleteTransaction,*/
                listTransactions: _listTransactions,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: IconPlusButton(
            callBack: () => startAddNewTransaction(context),
            iconSize: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
