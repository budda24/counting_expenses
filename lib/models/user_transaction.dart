import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import '../new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  static int id = 0;

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
    return Column(
      children: [
        NewTransaction(getTransactionList: _addNewTransaction),
        TransactionList(
          listTransactions: _listTransactions,
        ),
      ],
    );
  }
}
