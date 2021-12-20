import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter_complete_guide/const/const.dart';
import 'chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.listOfTransactionl}) : super(key: key);
  final List<Transaction> listOfTransactionl;
  static double totalSpentSum = 0;

  /*create list of map {'amount': totalSum,'day': DateFormat.E(weekDay),} for the chart*/
  List<Map<String, Object>> get grupedTransactionValues {
    /*genereting 7 week dayes*/
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double daySpentlSum = 0;

      /*go true the Transaction list given in constructor and count the expenses*/
      for (Transaction element in listOfTransactionl) {
        /*if the day is same add to the totalSum*/
        if (element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year) {
          daySpentlSum += element.amount;
        }
        totalSpentSum += element.amount;
      }
      return {
        'amount': daySpentlSum,
        /*from package Intl format DateTime object to dayes*/
        'day': DateFormat.E().format(weekDay),
      };
    });
  }

  List<Widget> get listOfCharts {
    List<Widget> tmpList = [];
    if (grupedTransactionValues.isNotEmpty) {
      int lenght = grupedTransactionValues.length;
      for (int i = 0; i < lenght; i++) {
        tmpList.add(Flexible(
          fit: FlexFit.tight,
          child: ChartBar(
            lable: grupedTransactionValues[i]['day'].toString(),
            spendedamount: double.parse(
                grupedTransactionValues[i]['amount'].toString()),
            totalSpendedamount:totalSpending,
          ),
        ));
      }
    } else {
      listOfCharts.add(ChartBar(lable: 'there is no transaction',
          spendedamount: 0,
          totalSpendedamount: 0));
    }
    return tmpList;
  }

  double get totalSpending {
    return grupedTransactionValues.fold(0.0, (sum, item) {
      return sum + double.parse(item['amount'].toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    print(listOfCharts);
    return Card(
      elevation: 6,
      margin: kMainMargin,
      color: kGreColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: listOfCharts,
        ),
      ),
    );
  }
}
