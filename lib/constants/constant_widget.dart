import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

Widget text(double size,Color color,FontWeight font_weight,String text,bool underlined){
  return Text(text,style: TextStyle(color: color,fontSize: size,fontWeight: font_weight,decoration: underlined? TextDecoration.underline:TextDecoration.none ,),);
}
Widget Ctext(double size,FontWeight font_weight,String text){
  return Text(text,style: TextStyle(fontSize: size,fontWeight: font_weight,),);
}

Widget button(String text, double width){
  return Container(
    width: width,
    height: 50,
    decoration: BoxDecoration(
    color: Colors.deepOrangeAccent,
   
    borderRadius: BorderRadius.circular(30),
  ),child:Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),)) ,);
}