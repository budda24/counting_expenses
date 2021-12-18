import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'models/transaction.dart';
import 'models/user_transaction.dart';
import 'new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  /*List whitch will be passed to the transaction list constructor*/
  static final List<Transaction> _listTransactions = [
    Transaction(amount: 159.99, date: DateTime.now(), id: 't1', title: 'shoes'),
    Transaction(amount: 40.99, date: DateTime.now(), id: 't2', title: 'golf')
  ];

  /*to lift stateUp From new_transaction*/
  void _addNewTransaction(String txTitle, double txAmount) {
    var tmpTx = Transaction(
        amount: txAmount, title: txTitle, date: DateTime.now(), id: 't1');
    setState(() {
      _listTransactions.add(tmpTx);
    });
  }
  
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
                callBack: () {},
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
              Text('Chart'),
              NewTransaction(getTransactionList: _addNewTransaction),
              TransactionList(
                listTransactions: _listTransactions,
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 20),
          child: IconPlusButton(callBack: (){},iconSize: 30,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class IconPlusButton extends StatelessWidget {
  const IconPlusButton({Key? key, required this.callBack, this.iconSize = 15}) :  super(key: key) ;
  final Function callBack;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: iconSize,
      backgroundColor: kGreColor,
      child: IconButton(
        color: kMainColor,
        iconSize: iconSize,
        onPressed: () {},
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
