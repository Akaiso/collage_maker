import 'package:flutter/material.dart';

class MainButtons extends StatelessWidget {
   const MainButtons({Key? key, this.name}) : super(key: key);
   final String? name;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *0.4,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text('BACKGROUND'),
      ),
    );
  }
}


Widget button(String? name, VoidCallback? onTap){
    return Builder(
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width *0.4,
          child: ElevatedButton(
            onPressed: onTap!,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child:  Text(name!),
          ),
        );
      }
    );
  }

