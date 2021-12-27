import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  TransactionList({required this.listTransactions, required this.lfDeleteTransaction});

  final List<Transaction> listTransactions;
  final Function lfDeleteTransaction;

  final randomColors = [
    Colors.black,
    Colors.white,
    Colors.grey,
    Colors.green,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Container(
      /*ListView.builder needs parent with constrain height*/
      height: height * 0.5,
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
                    height: height*0.0307,
                  ),
                  Container(
                    height: height * 0.2,
                    child: Image.asset('assets/images/waiting.png'),
                  )
                ],
              ),
            )
          : ListView.builder(
              itemCount: listTransactions.length,
              /*ctx = context*/
              itemBuilder: (ctx, index) {
                return Container(
                  margin:
                       EdgeInsets.symmetric(horizontal: height*0.0409, vertical: width*0.0128),
                  /*padding: const EdgeInsets.only(top: 8.0),*/
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(width: 3, color: kGreColor)),
                    leading: CircleAvatar(
                      radius: 50,
                      backgroundColor: randomColors[index],
                      child: FittedBox(
                        child: Text(
                          '\$${listTransactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: kMainColor,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      listTransactions[index].title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kGreColor),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat.yMMMd()
                                .format(listTransactions[index].date),
                            style: TextStyle(
                              color: kGreColor,
                            ),
                          ),
                        ]),
                    trailing: IconButton(
                      onPressed:() => lfDeleteTransaction(listTransactions[index].id),
                        icon: Icon(
                      Icons.auto_delete,
                      color: kGreColor,
                    )),
                  ),
                );
              },
            ),
    );
  }
}

class ggggg extends StatelessWidget {
  ggggg({Key? key}) : super(key: key);

  static final List<Transaction> listTransactions = [
    Transaction(amount: 155.00, date: DateTime.now(), id: 't1', title: 'shoes'),
    Transaction(amount: 122, date: DateTime.now(), id: 't2', title: 'golf')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listTransactions.length,
/*ctx = context*/
      itemBuilder: (ctx, index) {
        return Card(
          color: kGreColor,
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    DateFormat.yMMMd().format(listTransactions[index].date),
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
    );
  }
}
