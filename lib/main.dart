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
      /*for the buttom sheet to be scrolable*/
      isScrollControlled: true,
      builder: (_) {
        print('function trigered');
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: NewTransaction(
            getTransactionList: _addNewTransaction,
            /*passing the mediaquerydata object down to newtransaction*/
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
        /*substrct seven dayes from now*/
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  /*  sheet and lift stateUp from new_transaction to add one*/
  int _indexId = 1;
  void _addNewTransaction(String txTitle, double txAmount, DateTime date) {
    var tmpTx = Transaction(
        amount: txAmount,
        title: txTitle,
        date: date,
        id: 'transaction: $_indexId');
    _indexId++;
    setState(() {
      _listTransactions.add(tmpTx);
    });
    /*closing button sheet after transaction added*/
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

  /*methets for condition the display between modes*/
  List<Widget> _buildLandscapeContent() {
    return [
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
      chartOn
          ? Chart(
        listOfTransactionl: _currentListTransactions,
      )
          : TransactionList(
        lfDeleteTransaction: _deleteTransaction,
        listTransactions: _listTransactions,
      ),
    ];
  }

  List<Widget> _buildPortraitContent() {
    return [
      Chart(
        listOfTransactionl: _currentListTransactions,
      ),
      TransactionList(
        lfDeleteTransaction: _deleteTransaction,
        listTransactions: _listTransactions,
      ),
    ];
  }


  bool chartOn = true;

  @override
  Widget build(BuildContext context) {
    /*when the media query is being called all depending widgets get rebuild */
    /*Todo small sizes should not depend on media query change that*/
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double width = mediaQuery.size.width;
    double height = mediaQuery.size.height;
    /*for rendering difrent dependent on orientation*/
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;

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
              if (!isLandscape)
                /*Spread Operator children need widget but _buildPortraitContent return List of widgets*/
                ..._buildPortraitContent(),
              if (isLandscape)
                ..._buildLandscapeContent(),


            ],
          ),
        ),

        /*floating action button to open modalsheet*/
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: height * 0.0256),
          child: IconPlusButton(
            /*caling the opening of bottom sheet*/
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
