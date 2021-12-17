import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../const/const.dart';



class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: amountControler,
          decoration: InputDecoration(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
              color: kGreColor,
            ),
            label: Text('Amount spent'),
          ),
        ),
        TextField(
          controller: titleControler,
          decoration: InputDecoration(
            icon: Icon(
              Icons.all_inclusive_outlined,
              color: kGreColor,
            ),
            label: Text('Title'),
          ),
        ),
        TextButton(
          onPressed:addTransaction,
          child: Text(
            'Add Expenses',
            style: kTextTitle.copyWith(color: kMainColor),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
            elevation: MaterialStateProperty.all(8),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor: MaterialStateProperty.all(kGreColor),
          ),
        ),
      ],
    );
  }
}

