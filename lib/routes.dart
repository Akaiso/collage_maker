import 'package:flutter/material.dart';
import 'package:widget_test_for_photo_app/views/decoration_list.dart';
import 'package:widget_test_for_photo_app/views/error_page.dart';
import 'package:widget_test_for_photo_app/views/home_page.dart';
import 'package:widget_test_for_photo_app/views/image_list.dart';

Route<dynamic> appRouter(RouteSettings settings){

  switch(settings.name){
    case "/" : return MaterialPageRoute(builder: (conte)=>  HomePage());
    case "/imageList" : return MaterialPageRoute(builder: (context)=>  ImageList());
    case "/decorList" : return MaterialPageRoute(builder: (context)=> DecorList());
      default: return  MaterialPageRoute(builder: (context)=>  const E404(),);
  }

}