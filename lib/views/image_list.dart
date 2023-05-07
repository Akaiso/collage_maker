import 'package:flutter/material.dart';
import 'package:widget_test_for_photo_app/components/appbar.dart';
import 'package:widget_test_for_photo_app/models/image_model.dart';
import 'package:widget_test_for_photo_app/views/home_page.dart';



class ImageList extends StatefulWidget {
   const ImageList({Key? key}) : super(key: key);


  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
   HomePage homePage = const HomePage();

  addContent(value){
    // setState(() {
    //   background.add(value);
    // });
    background.add(value);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.orangeAccent,
      appBar: appbar(),
      body: ListView.builder(
        itemCount: imageList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
         return InkWell(onTap: (){
           addContent(imageList[index]);

          // Navigator.pushReplacementNamed(context, '/');
           Navigator.pushNamed(context, '/');
          // Navigator.pop(context);
          // Navigator.pop(context);
         // Navigator.popUntil(context, ModalRoute.withName('/'));
         },
           child: SizedBox(height: 80,
              child: Container(color: Colors.white,
                child: ListTile(
                  title: Text(imageListTitles[index]),
                  subtitle: const Text('- Tap to select'),
                  trailing: Container(
                    padding: const EdgeInsets.all(1),
                    height: 90,
                    width: 50,
                    child: imageList[index],
                  ),
                ),
              ),
            ),
         );
        },
      ),
    );
  }
}


