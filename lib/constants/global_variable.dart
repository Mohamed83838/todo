import 'package:flutter/cupertino.dart';


Widget Vspace(double height){
  return SizedBox(
    height:height,
  );
}

Widget Hspace(double width){
  return SizedBox(
    width:width,
  );
}

double ScreenH(BuildContext context){
  return MediaQuery.of(context).size.width;
}

double ScreenV(BuildContext context){
  return MediaQuery.of(context).size.height;
}

