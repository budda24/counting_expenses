import 'package:flutter/material.dart';

const kMainColor = Colors.lightGreenAccent;
const kGreColor = Colors.grey;
final kMainColorShade = Colors.lightGreenAccent.shade50;
const kWhiteColor = Colors.white;

const kTextTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const kMainMargin = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

const kBoxLinearGradient = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          const Color(0xFF64DD17),
          const Color(0xFFCCFF90),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp));
