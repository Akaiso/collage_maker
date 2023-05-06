import 'package:flutter/material.dart';


List<Image> imageList = [
  imageModel('purple_bg.png'),
  imageModel('light_bg1.png'),
  imageModel('bg_gold.jpeg'),
  imageModel('peach_bg.png'),
  imageModel('dark_bg.png'),
  imageModel('bg_standalone1.png'),
  imageModel('bg_standalone2.png')
];

List<String> imageListTitles = [
  'Purple background with balloons',
  'Light background with balloons',
  'Gold background with balloons',
  'Peach background with cupcake',
  'dark background with sparklers',
  'Ligt background with cake & balloons'
];

List<Widget> background = [];

Image imageModel(String string){
  return Image(
    image: AssetImage("assets/backgrounds/$string"),fit: BoxFit.cover,
  );
}