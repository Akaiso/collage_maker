import 'package:flutter/material.dart';

String? decoration;

List<Image> decorList = [
  decorImage(),
  decorImage(),
  decorImage()
];

Image decorImage(){
  return Image(image: AssetImage("assets/decorations/$decoration"));
}
