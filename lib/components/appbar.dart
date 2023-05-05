import 'package:flutter/material.dart';

AppBar appbar(){
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 30,
    title: const Padding(
      padding: EdgeInsets.only(top:10.0),
      child: Text('AIHS  PHOTO  APP', style: TextStyle(fontSize: 15),),
    ),
    centerTitle: true,
    backgroundColor: Colors.brown,
    elevation: 0,
  );
}