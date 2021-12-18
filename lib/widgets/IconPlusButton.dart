import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/const/const.dart';

class IconPlusButton extends StatelessWidget {
  const IconPlusButton({Key? key, required this.callBack, this.iconSize = 15})
      : super(key: key);
  final VoidCallback callBack;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: iconSize,
      backgroundColor: kGreColor,
      child: IconButton(
        color: kMainColor,
        iconSize: iconSize,
        onPressed:callBack,
        icon: Icon(
          Icons.add,
        ),
      ),
    );
  }
}