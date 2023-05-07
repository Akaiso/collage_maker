import 'package:flutter/material.dart';

String? decoration;

List<Image> decorationItemList = [
  decorImage('hb_decoration1.png'),
  decorImage('hb_decoration2.png'),
  decorImage('hb_decoration3.png'),
  decorImage('hb_decoration4.png'),
  decorImage('hb_decoration5.png'),
  decorImage('hb_decoration6.png'),
  decorImage('hb_decoration7.png'),
  decorImage('hb_decoration8.png'),
  decorImage('hb_decoration9.png'),
  decorImage('hb_decoration10.png'),
  decorImage('hb_decoration11.png'),
  decorImage('hb_decoration12.png'),
  decorImage('hb_decoration13.png'),

];

List<Image> decorationContainer = [];

Image decorImage(decoration){
  return Image(image: AssetImage("assets/decorations/$decoration"));
}
