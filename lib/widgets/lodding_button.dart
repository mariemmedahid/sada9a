
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../Constante.dart';


class Loddingbutton extends StatelessWidget {
  const Loddingbutton({
    this.color,
    this.height,
    this.width,
    this.haveBorder,
    this.loddinColor,
    Key? key,
  }) : super(key: key);

  final double? height;
  final double? width;

  final Color? color;
  final Color? loddinColor;

  final bool? haveBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height ,
        decoration: BoxDecoration(
            border: (haveBorder ?? false)
                ? Border.all(
                    color: loddinColor ?? Theme.of(context).backgroundColor)
                : null,
            color: primaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // CircularProgressIndicator(
              //   color: loddinColor ?? Colors.white,
              //   strokeWidth: 2,
              // )
              SpinKitRing(
                color: loddinColor ?? Colors.white,
                lineWidth: 2,
              ),
            ],
          ),
        ));
  }
}
