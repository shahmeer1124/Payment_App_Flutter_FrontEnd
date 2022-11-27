import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_payment_app/component/colors.dart';

class AppButtons extends StatelessWidget {
  final double? fontsize;
  final IconData icon;
  final Function()? onTap;
  final Color? backgroundcolor;
  final Color? iconcolor;
  final Color? textcolor;
  final String? text;

  const AppButtons(
      {Key? key,
      this.fontsize,
      required this.icon,
      this.onTap,
      this.backgroundcolor = AppColor.mainColor,
      this.iconcolor = Colors.white,
      this.textcolor = AppColor.mainColor,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: 40,
              height: 40,
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: backgroundcolor),
            ),
            text!=null?Text(text!,style: TextStyle(fontSize: 14,color: textcolor),):Container()
          ],
        ));
  }
}
