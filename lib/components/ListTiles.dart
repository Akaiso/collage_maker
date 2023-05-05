import 'package:flutter/material.dart';

Container imageListTile(String string) {
  return Container(
    height: 80,
    child: ListTile(
      title: Text('Green background with balloons'),
      subtitle: Text('Tap to select'),
      trailing: Container(
        padding: EdgeInsets.all(1),
        height: 90,
        width: 50,
        child: Image(
          image: AssetImage("assets/backgrounds/$string"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
