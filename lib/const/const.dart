import 'package:flutter/material.dart';

const kMainColor = Color(0xffD5ECC2);
const kGreColor = Color(0xff916BBF);
const kBlackColor = Colors.black;
final kMainColorShade = Colors.lightGreenAccent.shade50;
const kWhiteColor = Colors.white;

const kTextTitle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
const kTextinformation = TextStyle(fontSize: 10);



const kMainMargin = EdgeInsets.symmetric(vertical: 10, horizontal: 20);

const kBoxLinearGradient = BoxDecoration(
    gradient: LinearGradient(
        colors: [
          const Color(0xffFFAAA7),
          const Color(0xffD5ECC2),
        ],
        begin: const FractionalOffset(0.0, 0.0),
        end: const FractionalOffset(1.0, 0.0),
        stops: [0.0, 1.0],
        tileMode: TileMode.clamp));
