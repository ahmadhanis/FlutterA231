import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import '../models/user.dart';

class NewBookPage extends StatefulWidget {
  final User userdata;

  const NewBookPage({super.key, required this.userdata});

  @override
  State<NewBookPage> createState() => _NewBookPageState();
}

class _NewBookPageState extends State<NewBookPage> {
  late double screenWidth, screenHeight;
  File? _image;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    String dropdownvalue = 'New';
    var types = [
      'New',
      'Used',
      'Digital',
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("New Book")),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
            child: GestureDetector(
              onTap: () {
                showSelectionDialog();
              },
              child: Card(
                elevation: 8,
                child: Container(
                  height: screenHeight * 0.3,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: _image == null
                              ? const AssetImage("assets/images/camera.png")
                              : FileImage(_image!) as ImageProvider)),
                ),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
              height: screenHeight * 0.70,
              child: Form(
                child: Column(
                  children: [
                    const Text(
                      "Add New Book",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.isEmpty || (val.length < 3)
                            ? "Book title must be longer than 3"
                            : null,
                        onFieldSubmitted: (v) {},
                        controller: null,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'ISBN',
                            labelStyle: const TextStyle(),
                            icon: const Icon(
                              Icons.numbers,
                            ),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.camera)),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0),
                            ))),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.isEmpty || (val.length < 3)
                            ? "Book title must be longer than 3"
                            : null,
                        onFieldSubmitted: (v) {},
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Book Title',
                            labelStyle: TextStyle(),
                            icon: Icon(
                              Icons.book,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0),
                            ))),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.isEmpty || (val.length < 10)
                            ? "Book description must be longer than 10"
                            : null,
                        onFieldSubmitted: (v) {},
                        maxLines: 4,
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Book Description',
                            alignLabelWithHint: true,
                            labelStyle: TextStyle(),
                            icon: Icon(
                              Icons.description,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0),
                            ))),
                    TextFormField(
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.isEmpty || (val.length < 3)
                            ? "Book author must be longer than 3"
                            : null,
                        onFieldSubmitted: (v) {},
                        controller: null,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: 'Book Author',
                            labelStyle: TextStyle(),
                            icon: Icon(
                              Icons.person_2,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0),
                            ))),
                    Row(
                      children: [
                        Flexible(
                            flex: 3,
                            child: Container(
                              child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  validator: (val) =>
                                      val!.isEmpty || (val.length < 3)
                                          ? "Product price must contain value"
                                          : null,
                                  onFieldSubmitted: (v) {},
                                  controller: null,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'Book Price',
                                      labelStyle: TextStyle(),
                                      icon: Icon(Icons.money),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2.0),
                                      ))),
                            )),
                        Flexible(
                            flex: 3,
                            child: Container(
                              child: TextFormField(
                                  textInputAction: TextInputAction.next,
                                  validator: (val) =>
                                      val!.isEmpty || (val.length < 3)
                                          ? "Product price must contain value"
                                          : null,
                                  onFieldSubmitted: (v) {},
                                  controller: null,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                      labelText: 'Quantity',
                                      labelStyle: TextStyle(),
                                      icon: Icon(Icons.add_box),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 2.0),
                                      ))),
                            )),
                        Flexible(
                          flex: 3,
                          child: Container(
                              margin: EdgeInsets.all(8),
                              height: 50,
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0))),
                              child: DropdownButton(
                                value: dropdownvalue,
                                underline: const SizedBox(),
                                isExpanded: true,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: types.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  print(newValue);
                                  newValue = dropdownvalue;

                                  setState(() {
                                    dropdownvalue = newValue!;
                                  });
                                },
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(screenWidth * 0.80, 40)),
                      child: const Text('Add Product'),
                      onPressed: () => {},
                    ),
                    // Container(
                    //     margin: EdgeInsets.all(8),
                    //     height: 60,
                    //     padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    //     decoration: BoxDecoration(
                    //         border: Border.all(color: Colors.grey),
                    //         borderRadius:
                    //             const BorderRadius.all(Radius.circular(5.0))),
                    //     child: DropdownButton(
                    //       value: dropdownvalue,
                    //       underline: const SizedBox(),
                    //       isExpanded: true,
                    //       icon: const Icon(Icons.keyboard_arrow_down),
                    //       items: types.map((String items) {
                    //         return DropdownMenuItem(
                    //           value: items,
                    //           child: Text(items),
                    //         );
                    //       }).toList(),
                    //       onChanged: (String? newValue) {
                    //         print(newValue);
                    //         newValue = dropdownvalue;

                    //         setState(() {
                    //           dropdownvalue = newValue!;
                    //         });
                    //       },
                    //     )),
                  ],
                ),
              )),
        ]),
      ),
    );
  }

  void showSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
            title: const Text(
              "Select from",
              style: TextStyle(),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenWidth / 4, screenHeight / 8)),
                  child: const Text('Gallery'),
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    _selectfromGallery(),
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(screenWidth / 4, screenHeight / 8)),
                  child: const Text('Camera'),
                  onPressed: () => {
                    Navigator.of(context).pop(),
                    _selectFromCamera(),
                  },
                ),
              ],
            ));
      },
    );
  }

  Future<void> _selectfromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 800,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);
      cropImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> _selectFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 800,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      _image = File(pickedFile.path);

      cropImage();
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage() async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: _image!.path,
      aspectRatioPresets: [
        //CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Please Crop Your Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedFile != null) {
      File imageFile = File(croppedFile.path);
      _image = imageFile;
      setState(() {});
    }
  }
}
