import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  const SizedText({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textsize = _textsize(text);
    return Container(
      child: Column(children: [
        Text(
          text,
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.w700),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
        ),
        SizedBox(height: 5,),
        Row(
          children: [
            for (int i = 0; i < textsize.width / 5; i++)
             i.isEven? Container(
                width: 5,
                color: color,
                height: 2,
              ):Container(
                width: 5,
                color: Colors.white,
                height: 2,
              )
          ],
        )
      ]),
    );
  }

  Size _textsize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
              color: color, fontSize: 16, fontWeight: FontWeight.w700)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }
}
