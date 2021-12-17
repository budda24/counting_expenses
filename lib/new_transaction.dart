import 'package:flutter/material.dart';

import 'const/const.dart';
import 'models/transaction.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({Key? key}) : super(key: key);


  static final TextEditingController titleControler = TextEditingController();
  static final TextEditingController amountControler = TextEditingController();

  static final List<Transaction> _listTransactions = [
    Transaction(amount: 159.99, date: DateTime.now(), id: 't1', title: 'shoes'),
    Transaction(amount: 40.99, date: DateTime.now(), id: 't2', title: 'golf')
  ];
  static int id = 0;

  addTransaction(){
    id++;
    double amount =double.parse(amountControler.text) ;
    String title = titleControler.text;
    /*listTransactions.add(Transaction(amount: amount, date: date, id: 't$id', title: title));*/
  }

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
