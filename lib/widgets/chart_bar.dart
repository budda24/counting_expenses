import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.lable,
    required this.spendedamount,
    required this.totalSpendedamount,
    /*required this.dateTime,*/
  }) : super(key: key);

  final String lable;
  final double spendedamount;
  final double totalSpendedamount;

  /*final DateTime dateTime;*/

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        double width = constrains.maxWidth;
        return Column(
          children: [
            Container(
              child: Text(
                '\$${spendedamount.toStringAsFixed(0)}',
                style: TextStyle(color: kMainColor),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 60,
              width: width*0.500,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: kMainColor,
                      border: Border.all(color: kGreColor, width: 1),
                    ),
                  ),
                  /*to reverse FractionalBox to from top ti bottom you have to use Algin*/
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: totalSpendedamount == 0
                          ? 0.0
                      /*to get the procentage of total*/
                          : spendedamount / totalSpendedamount,
                      child: Container(
                        color: kGreColor.withGreen(1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              lable,
              style: kTextTitle.copyWith(color: kBlackColor),
            ),
          ],
        );
      },
    );
  }
}
