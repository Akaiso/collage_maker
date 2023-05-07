import 'package:flutter/material.dart';


List<Image> imageList = [
  imageModel('purple_bg.png'),
  imageModel('light_bg1.png'),
  imageModel('bg_gold.jpeg'),
  imageModel('peach_bg.png'),
  imageModel('dark_bg.png'),
  imageModel('bg_standalone1.png'),
  imageModel('bg_standalone2.png'),
  imageModel('bg_standalone3.png'),
  imageModel('bg_standalone4.png'),
  imageModel('bg_standalone5.png'),
  imageModel('bg_standalone6.png')
];

List<String> imageListTitles = [
  'Purple background with balloons',
  'Light background with balloons',
  'Gold background with balloons',
  'Peach background with cupcake',
  'dark background with sparklers',
  'Light standalone background with cake & balloons',
  'yellow standalone background with balloons',
  'dark standalone background with sparklers',
  'Light standalone background',
  'Peach standalone background with cake',
  'Purple standalone background with balloons'
];

List<Widget> background = [];

Image imageModel(String string){
  return Image(
    image: AssetImage("assets/backgrounds/$string"),fit: BoxFit.cover,
  );
}