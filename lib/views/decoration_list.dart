import 'package:flutter/material.dart';
import 'package:widget_test_for_photo_app/components/appbar.dart';

import '../models/decoration_model.dart';

class DecorList extends StatefulWidget {
  const DecorList({Key? key}) : super(key: key);

  @override
  State<DecorList> createState() => _DecorListState();
}

class _DecorListState extends State<DecorList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: ListView.builder(itemCount: decorList.length,
      itemBuilder: (context, index){
        return Container();
      }),
    );
  }
}
