import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList({required this.listTransactions});

  final List<Transaction> listTransactions;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      /*ListView.builder needs parent with constrain height*/
      height: size.height * 0.5,
      child: listTransactions.isEmpty
          ? Center(
              child: Column(
                children: [
                  Card(
                    color: kGreColor,
                    child: Text(
                      'You don\'t have expenses yet :)',
                      style: kTextTitle,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: size.height * 0.2,
                    child: Image.asset('assets/images/waiting.png'),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: listTransactions.length,
              /*ctx = context*/
              itemBuilder: (ctx, index) {
                return Card(
                  color: kGreColor,
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: kMainMargin,
                        decoration: BoxDecoration(
                          color: kGreColor,
                          border: Border.all(
                            color: kMainColor,
                            width: 2,
                          ),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          '\$${listTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: kMainColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            listTransactions[index].title,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: kMainColor),
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(listTransactions[index].date),
                            style: TextStyle(
                              color: kGreColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
