import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_payment_app/component/colors.dart';

class AppLargeButoon extends StatelessWidget {
  final Color? backgroundcolr;
  final Color? textcolor;
  final String text;
  final Function()? ontap;
  final bool? isBorder;

  const AppLargeButoon(
      {Key? key,
      this.backgroundcolr: AppColor.mainColor,
      this.textcolor: Colors.white,
      this.ontap,
      this.isBorder: false,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30),
        height: 60,
        width: MediaQuery.of(context).size.width - 60,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color:textcolor,fontWeight: FontWeight.w600),
        )),
        decoration: BoxDecoration(
            color: backgroundcolr,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 2, color: AppColor.mainColor)),
      ),
      onTap: ontap,
    );
  }
}
