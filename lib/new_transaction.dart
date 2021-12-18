import 'package:flutter/material.dart';

import 'const/const.dart';
import 'models/transaction.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({Key? key, required this.getTransactionList})
      : super(key: key);
  final Function getTransactionList;

  static final TextEditingController titleControler = TextEditingController();
  static final TextEditingController amountControler = TextEditingController();

  void submitData() {
    final transactionTitle = titleControler.text;
    final transactionAmount =
        double.parse(amountControler.text).toStringAsFixed(2);
    if (transactionTitle.isEmpty || double.parse(transactionAmount) <= 0) {
      return;
    }

    /*lift input data to the user_transaction*/
    getTransactionList(
      titleControler.text,
      double.parse(amountControler.text),
    );
    titleControler.clear();
    amountControler.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: kMainMargin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: amountControler,
            onSubmitted: (_) => submitData(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: kGreColor,
              icon: Icon(
                Icons.account_balance_wallet_outlined,
                color: kGreColor,
              ),
              label: Text(
                'Amount spent',
                style: TextStyle(color: kMainColor),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: titleControler,
            onSubmitted: (_) => submitData(),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: kGreColor,
              icon: Icon(
                Icons.all_inclusive_outlined,
                color: kGreColor,
              ),
              label: Text(
                'Title',
                style: TextStyle(color: kMainColor),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () => submitData(),
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
      ),
    );
  }
}
