import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadague/Constante.dart';

Widget Mybutton (String text,VoidCallback ontap,int width){
  return Padding(
                                      padding: const EdgeInsets.all(10.0),
                                       child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(primary: primaryColor),
                                        onPressed: ontap,
                                        child: Text(text),
                                      ),
                                    );
}