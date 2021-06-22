import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _status;
  List _statusname = ['All', 'New', 'Used'];
  var image;
  List<File> imageArray = [];
  _openGallery() async {
    if (imageArray.length < 5) {
      image = await ImagePicker.platform.pickImage(source: ImageSource.gallery);
      File file = File(image.path);
      imageArray.add(file);
      setState(() {
        print(imageArray);
      });
    }
  }
  

  bool isNameBlank = false;
  bool isColorBlank = false;
  bool isConditionBlank = false;
  bool isPostedBlank = false;
  bool iswarrantyBlank = false;
  bool isStatusBlank = false;
  bool isPriceBlank = false;
  bool isSizeBlank = false;
  bool isCameraBlank = false;
  bool isRamBlank = false;
  bool isBatteryBlank = false;
  bool isFrontBlank = false;
  bool isRearBlank = false;
  bool isProcessorBlank = false;
  bool isRomBlank = false;

  var child;
  TextEditingController nameController = new TextEditingController();
  TextEditingController statusController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController sizeController = new TextEditingController();
  TextEditingController cameraController = new TextEditingController();
  TextEditingController ramController = new TextEditingController();
  TextEditingController batteryController = new TextEditingController();
  TextEditingController colorController = new TextEditingController();
  TextEditingController conditionController = new TextEditingController();
  TextEditingController postedController = new TextEditingController();
  TextEditingController warrantyController = new TextEditingController();
  TextEditingController frontController = new TextEditingController();
  TextEditingController rearController = new TextEditingController();
  TextEditingController processorController = new TextEditingController();
  TextEditingController romController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.blue),
          title: Text(
            "Add features",
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          // actions: [
          //   IconButton(
          //       icon: Icon(
          //         Icons.add_circle_outline,
          //         color: Colors.blue,
          //       ),
          //       onPressed: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //                 builder: (context) => Editaddresspage()));
          //       }),
          // ],
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      //height: 50,
                                      //width: 320,
                                      margin: EdgeInsets.only(top: 5),
                                      padding: EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 0,
                                          bottom: 0),
                                      decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          border: Border.all(width: 0.1),
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: TextField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                            prefixText: 'Model - ',
                                            labelText: "Enter mobile model",
                                            labelStyle: TextStyle(
                                              color: Colors.blue,
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isNameBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "model field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropDownField(
                                      controller: statusController,
                                      enabled: true,
                                      items: status,
                                      onValueChanged: (value) {
                                        setState(() {
                                          selectStatus = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: statusController,
                                          decoration: InputDecoration(
                                            prefixText: "Status - ",
                                            labelText: "Enter status",
                                            labelStyle: TextStyle(
                                              color: Colors.blue,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isStatusBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "status is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          textAlign: TextAlign.left,
                                          controller: priceController,
                                          decoration: InputDecoration(
                                              prefixText: "Price - ",
                                              labelText: "Enter price",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isPriceBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "price field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: sizeController,
                                          decoration: InputDecoration(
                                              prefixText: "Display - ",
                                              labelText: "Enter Display size",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isSizeBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Display field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: frontController,
                                          decoration: InputDecoration(
                                              prefixText: "Front camera - ",
                                              labelText: "Enter front camera",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isFrontBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "front camera field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: rearController,
                                          decoration: InputDecoration(
                                              labelText: "Enter rear camera",
                                              prefixText: "Rear camera - ",
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isRearBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "rear field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: processorController,
                                          decoration: InputDecoration(
                                              prefixText: "Processor - ",
                                              labelText: "Enter processor",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isProcessorBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Processor field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: romController,
                                          decoration: InputDecoration(
                                              prefixText: "Rom - ",
                                              labelText: "Enter rom ",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isRomBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Rom field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: ramController,
                                          decoration: InputDecoration(
                                              prefixText: "Ram -",
                                              labelText: "Enter ram",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    isRamBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Rom field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: batteryController,
                                          decoration: InputDecoration(
                                              prefixText: "Battery - ",
                                              labelText: "Enter Battery",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    isBatteryBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Battery field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: colorController,
                                          decoration: InputDecoration(
                                              prefixText: "Color - ",
                                              labelText: "Enter Color",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    isColorBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Color field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    DropDownField(
                                      controller: conditionController,
                                      enabled: true,
                                      items: condition,
                                      onValueChanged: (value) {
                                        setState(() {
                                          selectCondition = value;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: conditionController,
                                          decoration: InputDecoration(
                                              prefixText: "Condition - ",
                                              labelText:
                                                  "Enter product condition",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    isConditionBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "condition field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //height: 50,
                                        //width: 320,
                                        margin: EdgeInsets.only(top: 5),
                                        padding: EdgeInsets.only(
                                            left: 10,
                                            right: 0,
                                            top: 0,
                                            bottom: 0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey[100],
                                            border: Border.all(width: 0.1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: TextField(
                                          controller: warrantyController,
                                          decoration: InputDecoration(
                                              prefixText: " Warranty - ",
                                              labelText:
                                                  "Enter warranty(if have)",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                    iswarrantyBlank
                                        ? Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.error_outline,
                                                  color: Colors.redAccent,
                                                  size: 17,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Warranty field is empty",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )
                                              ],
                                            ),
                                          )
                                        : Container(),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    imageArray.length == 5
                                        ? Container()
                                        : Container(
                                            child: FlatButton(
                                              onPressed: () {
                                                _openGallery();
                                              },
                                              splashColor: Colors.white,
                                              child: Center(
                                                child: Text(
                                                    "Open Gallery (Max no. 5)"),
                                              ),
                                            ),
                                          ),
                                    Container(
                                        child: imageArray.length == 0
                                            ? Center(
                                                child: Text("No image found"),
                                              )
                                            : Wrap(
                                                children: List.generate(
                                                    imageArray.length, (index) {
                                                  var img = imageArray[index];
                                                  return Card(
                                                    elevation: 1,
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10, bottom: 10),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Image.file(
                                                              img,
                                                              height: 150,
                                                              width: 150,
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                imageArray
                                                                    .removeAt(
                                                                        index);
                                                              });
                                                            },
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(5.0),
                                                              child: Text(
                                                                "Remove",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        print("hit");
                                        setState(() {
                                          if (nameController.text == "") {
                                            isNameBlank = true;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("1");
                                          } else if (statusController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = true;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("2");
                                          } else if (priceController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = true;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("3");
                                          } else if (conditionController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = true;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("4");
                                          } else if (statusController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = true;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("5");
                                          } else if (sizeController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = true;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("6");
                                          } else if (ramController.text == "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = true;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("7");
                                          } else if (colorController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = true;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("8");
                                          }  else if (batteryController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = true;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("10");
                                          } else if (conditionController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = true;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("11");
                                          } else if (frontController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = true;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("12");
                                          } else if (rearController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = true;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = true;
                                            isProcessorBlank = false;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("13");
                                          } else if (processorController.text ==
                                              "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = true;
                                            isRomBlank = false;
                                            iswarrantyBlank = false;
                                            print("14");
                                          } else if (romController.text == "") {
                                            isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isConditionBlank = false;
                                            isStatusBlank = false;
                                            isSizeBlank = false;
                                            isRamBlank = false;
                                            isColorBlank = false;
                                            isCameraBlank = false;
                                            isBatteryBlank = false;
                                            isConditionBlank = false;
                                            isFrontBlank = false;
                                            isRearBlank = false;
                                            isProcessorBlank = false;
                                            isRomBlank = true;
                                            iswarrantyBlank = false;
                                            print("15");
                                          } else {
                                            var payLoad = {
                                              'name': nameController.text,
                                              'price': priceController.text,
                                              'size': sizeController.text,
                                              'front': frontController.text,
                                              'rear': rearController.text,
                                              'processor':
                                                  processorController.text,
                                              'rom': romController.text,
                                              'color': colorController.text,
                                              'ram': ramController.text,
                                              'battery': batteryController.text,
                                              'status': statusController.text,
                                              'product_condition':
                                                  conditionController.text,
                                              'warranty':
                                                  warrantyController.text,
                                            };
                                            print("hit");
                                            sendMobileInfo(payLoad);
                                            itemList.add(payLoad);
                                  
                                          }
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 20),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.blue),
                                        child: Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Submit",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ),
                                              Container(
                                                child: Icon(
                                                  Icons.arrow_right,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            )
                          ])
                    ]))));
  }

  Future sendMobileInfo(payLoad) async {
    print("hit");
    final response = await http.post(mblEndPoint, body: payLoad);
    print("response");
    print(response);
    int statusCode = response.statusCode;
    print(statusCode);
    String bodyResponse = response.body;
    print(bodyResponse);
  }
}

String selectStatus = "";
List<String> status = ["All", "New", "Used"];
String selectCondition = "";
List<String> condition = ["Very good", "Good", "Bad"];
