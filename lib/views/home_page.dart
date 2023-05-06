import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:widget_test_for_photo_app/components/appbar.dart';
import 'package:widget_test_for_photo_app/models/image_model.dart';

import '../components/buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;
  Widget selectedImage = Container();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  String name = 'Add name';
  String date = 'Add birthday date';
  String headline = 'FABULOUS AIHS (2001 SET) CELEBRATES YOU';
  GlobalKey globalKey = GlobalKey();

  bool statusCheck = false;

  Future requestPermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (status.isGranted) {
      statusCheck = true;
    }

    var status1 = await Permission.storage.status;
    if (!status1.isGranted) {
      await Permission.manageExternalStorage.request();
    }
  }

  Future<void> _save() async {
    await requestPermission();
    RenderRepaintBoundary boundary =
        globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png)
        as FutureOr<ByteData?>);
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
    }
    // Uint8List pngBytes = byteData.buffer.asUint8List();
    // if(!(await Permission.storage.status.isGranted))
    //   await Permission.storage.request();
    //
    // final result = await ImageGallerySaver.saveImage(
    //   Uint8List.fromList(pngBytes),
    //   quality: 60,
    //   name: "Benson's photo app image" , // "canvas_image";
    //  // print(result);
    // );
  }

  removeBgContent() {
    setState(() {
      background.clear();
      Navigator.pop(context);
    });
  }

  Widget updateContentList() {
    setState(() {
      background;
    });
    return background.last;
  }

  // List<File> imageList = [];

  Future pickImageFromGallery() async {
    try {
      final imageFile = (await ImagePicker().pickImage(
          source: ImageSource.gallery, maxWidth: 200, maxHeight: 200));
      if (imageFile == null) return;
      final imageTemp = File(imageFile.path);
      setState(() {
        this.imageFile = imageTemp;
      });
    } on PlatformException catch (e) {
      printError(info: 'failed to pick image: $e');
    }
  }

  Future pickImageFromCamera() async {
    try {
      final imageFile = (await ImagePicker().pickImage(
          source: ImageSource.camera, maxWidth: 200, maxHeight: 200));
      if (imageFile == null) return;
      final imageTemp = File(imageFile.path);
      setState(() {
        this.imageFile = imageTemp;
      });
    } on PlatformException catch (e) {
      printError(info: 'failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {

    // initState(
    //   initialization();
    // )

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: appbar(),
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                color: Colors.black,
                child: RepaintBoundary(
                  key: globalKey,
                  child: Stack(fit: StackFit.passthrough, children: [
                    background.isEmpty
                        ? const Center(
                            child: Text(
                              'ADD CONTENT HERE',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : updateContentList(),
                    // imageFile != null
                    //     ? Image.file(imageFile!)
                    //     : const Text(
                    //         '',
                    //         style: TextStyle(color: Colors.white),
                    //    ),
                    Positioned(
                        left: 7,
                        top: 5,
                        child: Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black54),
                          child: Center(
                            child: Text(
                              headline,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  letterSpacing: 2),
                            ),
                          ),
                        )),

                    Positioned(
                      left: 10,
                      top: 33,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        // backgroundImage: AssetImage(imageFile != null? '$imageFile':'assets/images/background/3_ballons.png'),
                        // backgroundImage: AssetImage('    assets/backgrounds/bg1.jpeg'),
                        radius: 100,
                        //  child: ClipRRect(borderRadius: BorderRadius.circular(100),clipBehavior: Clip.hardEdge,
                        child: ClipOval(
                          child: imageFile != null
                              ? Image.file(
                                  imageFile!,
                                  height: 300,
                                  width: 300,
                                  fit: BoxFit.cover,
                                )
                              : const Text(
                                  '',
                                  style: TextStyle(
                                      color: Colors.white, letterSpacing: 2),
                                ),
                        ),
                        // child: ClipOval(
                        //   child:     imageFile != null
                        //       ? Image.file(imageFile!,height: 300,width: 300,fit: BoxFit.cover,)
                        //       : const Text(
                        //     'IMAGE',
                        //     style: TextStyle(
                        //         color: Colors.white, letterSpacing: 2),
                        //   ),
                        // ),

                        //Text('image')
                        // imageFile != null
                        //     ? Image.file(imageFile!)
                        //     : const Text(
                        //         'IMAGE',
                        //         style: TextStyle(
                        //             color: Colors.white, letterSpacing: 2),
                        //       ),
                      ),
                    ),

                    Positioned(
                      top: 241,
                      child: Container(
                        color: Colors.white70,
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: ListTile(
                          title: Text(
                            name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          subtitle: Text(
                            date,
                            style: const TextStyle(color: Colors.black),
                          ),
                          trailing: Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: SizedBox(
                                height: 70,
                                width: 60,
                                child: Image.asset(
                                  'assets/logo/aihs_logo_2.png',
                                  scale: 1,
                                )),
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
             // SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button('BACKGROUND', () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                color: Colors.orangeAccent,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      button('ADD', () {
                                        //this will prevent the modal from showing again after tapping back on the imageList Screen
                                        //  Navigator.pop(context);
                                        Navigator.pushReplacementNamed(
                                            context, '/imageList');
                                      }),
                                      button('REMOVE', () {
                                        removeBgContent();
                                        // Navigator.pushReplacementNamed(context, "/");
                                      })
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        button('IMAGE', () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                color: Colors.orangeAccent,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      button('GALLERY', () async {
                                        //this will prevent the modal from showing again after tapping back on the imageList Screen
                                        //  Navigator.pushReplacementNamed(context, '/');
                                        Navigator.pop(context);
                                        pickImageFromGallery();
                                        //  Navigator.pushNamed(context, '/');
                                      }),
                                      button('CAMERA', () {
                                        Navigator.pop(context);
                                        pickImageFromCamera();
                                      }),
                                      button('REMOVE', () {
                                        Navigator.pushReplacementNamed(
                                            context, "/");
                                      })
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        button('ADD TEXT', () {
                          showDialog(
                            context: context,
                            builder: (context) => Dialog(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                color: Colors.orangeAccent,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Form(
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        SizedBox(
                                          height: 35,
                                          child: Center(
                                            child: TextFormField(
                                              controller: nameController,
                                              decoration: InputDecoration(
                                                hintText: 'Name',
                                                contentPadding:
                                                    const EdgeInsets.all(10),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 35,
                                          child: Center(
                                            child: TextFormField(
                                              controller: dateController,
                                              decoration: InputDecoration(
                                                  hintText: 'Date',
                                                  contentPadding:
                                                      const EdgeInsets.all(10),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            ),
                                          ),
                                        ),
                                        button('SUBMIT', () {
                                          name = nameController.text;
                                          date = dateController.text;
                                          nameController.clear();
                                          dateController.clear();
                                          Navigator.pop(context);
                                        }),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                        button('DECOR', () {

                        })
                      ],
                    ),
                    SizedBox(height: 10,),
                    button('DONE', () async {
                      requestPermission();
                      _save();
                      ScaffoldMessenger.of(context).showSnackBar(snack);
                    })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

SnackBar snack =  SnackBar(
  content: const Text('Image saved to gallery'),
  behavior: SnackBarBehavior.floating,
  duration: const Duration(milliseconds: 1000),
  elevation: 5,
  margin: const EdgeInsets.only(left: 5, right: 20, bottom: 10),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
);


