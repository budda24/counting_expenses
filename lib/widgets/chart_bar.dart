import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.lable,
    required this.spendedamount,
    required this.totalSpendedamount,
  }) : super(key: key);

  final String lable;
  final double spendedamount;
  final double totalSpendedamount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
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
          width: 30,
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
                      : spendedamount / totalSpendedamount,
                  child: Container(
                    color: Colors.black54,
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
          style: kTextTitle.copyWith(color: kMainColor),
        )
      ],
    );
  }
}
