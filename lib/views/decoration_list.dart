import 'package:flutter/material.dart';
import 'package:widget_test_for_photo_app/components/appbar.dart';
import 'package:widget_test_for_photo_app/components/buttons.dart';

import '../models/decoration_model.dart';

class DecorList extends StatefulWidget {
  const DecorList({Key? key}) : super(key: key);

  @override
  State<DecorList> createState() => _DecorListState();
}

class _DecorListState extends State<DecorList> {

  addToDecorationContainer(value){
    setState(() {
      decorationContainer.add(value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      bottomNavigationBar: BottomAppBar(child: Container(height: MediaQuery.of(context).size.height * 0.1,
        child: Center(
          child: button('CLEAR DECOR', () {
            decorationContainer.clear();
            Navigator.restorablePushNamed(context, '/');
          }),
        ),
      ),),
      body: ListView.builder(itemCount: decorationItemList.length,
      itemBuilder: (context, index){
        return Column(
          children: [
            InkWell(
              onTap: (){
                addToDecorationContainer(decorationItemList[index]);
                Navigator.pushNamed(context, '/');
            },
              child: Container(
                child: decorationItemList[index]
              ),
            ),
            Container(height: 2,color: Colors.brown,)
          ],
        );
      }),
    );
  }
}
