import 'package:flutter/material.dart';


List<Image> imageList = [
  imageModel('green_bg.jpeg'),
  imageModel('bg1.jpeg'),
  imageModel('bg_gold.jpeg'),
  imageModel('bg_purple.jpeg')
];

List<String> imageListTitles = [
  'Green background with balloons',
  'white background with balloons',
  'purple background with balloons',
  'red background with balloons'
];

List<Widget> background = [];

Image imageModel(String string){
  return Image(
    image: AssetImage("assets/backgrounds/$string"),fit: BoxFit.cover,
  );
}