import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
class AddLaptop extends StatefulWidget {
 
  @override
  _AddLaptopState createState() => _AddLaptopState();
}

class _AddLaptopState extends State<AddLaptop> {
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
  bool isDisplayBlank = false;
  bool isStorageBlank = false;
  bool isPriceBlank = false;

  bool iswarrantyBlank = false;
  bool isStatusBlank = false;
  bool isConditionBlank = false;
  bool isBatteryBlank=false;
  bool isProcessorBlank=false;
  bool isMemoryBlank = false;
  bool isGraphicsBlank = false;
  bool isColorBlank=false;
  var child;
  TextEditingController nameController = new TextEditingController();
  TextEditingController displayController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController storageController = new TextEditingController();
  TextEditingController graphicsController = new TextEditingController();
  TextEditingController statusController = new TextEditingController();
  TextEditingController processorController=new TextEditingController();
    TextEditingController batteryController=new TextEditingController();
  TextEditingController memoryController = new TextEditingController();
  TextEditingController conditionController = new TextEditingController();
  TextEditingController postedController = new TextEditingController();
  TextEditingController warrantyController = new TextEditingController();
  TextEditingController colorController=new  TextEditingController();
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
                                           prefixText:'Model - ',
                                            labelText:
                                                "Enter laptop model",
                                            labelStyle: TextStyle(
                                              color: Colors.blue,
                                            ),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
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
                                      items:status,
                                    
                                      onValueChanged: (value){
                                        setState(() {
                                          selectStatus=value;
                                        });
                                      },
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
                                          controller: statusController,
                                          decoration: InputDecoration(
                                           prefixText: "Status - ",
                                              labelText: "Enter status",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                        SizedBox(height: 10,),
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
                                              labelText:
                                            
                                                  "Enter price",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                        SizedBox(height: 10,),
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
                                          controller:displayController,
                                          decoration: InputDecoration(
                                         prefixText: "Display - ",
                                              labelText:
                                                  "Enter Display size",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
                                    isDisplayBlank
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
                                          controller: storageController,
                                          decoration: InputDecoration(
                                         prefixText: "Storage - ",
                                              labelText:
                                                  "Enter storage",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
                                    isStorageBlank
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
                                                  "Storage field is empty",
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
                                              labelText:
                                                  "Enter Processor",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
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
                                          controller: batteryController,
                                          decoration: InputDecoration(
                                             prefixText: "Battery - ",
                                              labelText:
                                                  "Enter battery",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
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
                                              labelText:
                                                  "Enter Color",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
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
                                          controller: memoryController,
                                          decoration: InputDecoration(
                                            prefixText: "Memory - ",
                                              labelText:
                                                  "Enter Memory space",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
                                    isMemoryBlank
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
                                                  "Memory field is empty",
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
                                          controller: graphicsController,
                                          decoration: InputDecoration(
                                            prefixText: "Graphics - ",
                                              labelText:
                                                  "Enter graphics",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
                                    isGraphicsBlank
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
                                                  "Graphics field is empty",
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
                                         DropDownField(
                                      controller: conditionController,
                                      enabled: true,
                                      items:status,
                                    
                                      onValueChanged: (value){
                                        setState(() {
                                          selectStatus=value;
                                        });
                                      },
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
                                        SizedBox(height: 10,),
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
                                             prefixText: "Warranty - ",
                                              labelText:
                                                  "Enter warranty(if have)",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
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
                                        setState(() {
                                          if (nameController.text == "") {
                                            isNameBlank = true;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                            isColorBlank=false;
                                            isConditionBlank=false;
                                          } else if (statusController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = true;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          } 
                                           else if (priceController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = true;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (memoryController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = true;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                           
                                           isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (storageController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = true;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                       
                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (graphicsController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = true;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                         
                                        isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (displayController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=true;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                          
                                       isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (processorController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = true;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                            isDisplayBlank=false;
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (batteryController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = true;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                            isDisplayBlank=false;
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (memoryController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = true;
                                            isStorageBlank = false;
                                           
                                            isDisplayBlank=false;
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (storageController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = true;
                                            
                                            isDisplayBlank=false;
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (graphicsController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                            isDisplayBlank=false;
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          }
                                           else if (displayController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                           
                                            isDisplayBlank=true;
                                             isColorBlank=false;
                                            isConditionBlank=false;
                                          } else if (colorController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            
                                            isDisplayBlank=false;
                                             isColorBlank=true;
                                            isConditionBlank=false;
                                          }
                                           else if (conditionController.text ==
                                              "") {
                                          isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                            isGraphicsBlank = false;
                                            isDisplayBlank=false;
                                            isProcessorBlank = false;
                                            isBatteryBlank = false;
                                            isMemoryBlank = false;
                                            isStorageBlank = false;
                                           
                                            isDisplayBlank=false;
                                             isColorBlank=false;
                                            isConditionBlank=true;
                                          }
                                          
                                          else {
                                            var payLoad = {
                                              'name': nameController.text,
                                              'price': priceController.text,
                                              'display': displayController.text,
                                              'color': colorController.text,
                                              'storage': storageController.text,
                                               'memory': memoryController.text,
                                                'graphics': graphicsController.text,
                                              'processor': processorController.text,
                                            'battery': batteryController.text,
                                             'status': statusController.text,
                                            'product_condition':conditionController.text,
                                           
                                              'warranty': warrantyController.text,
                                            };
                                            print("hit");
                                            sendLaptopInfo(payLoad);
                                            laptopitemList.add(payLoad);
                                            // Navigator.pop(context
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
                                  ]))
                        ])
                  ]),
            )));
   
  }
  
  Future sendLaptopInfo(payLoad) async {
    print("hit");
    final response = await http.post(lptpEndPoint, body: payLoad);
    print("response");
    print(response);
    int statusCode = response.statusCode;
    print(statusCode);
    String bodyResponse = response.body;
    print(bodyResponse);
  }
}
String selectStatus="";
List<String> status =[
"All",
"New",
"Used"
];
String selectCondition="";
List<String> condition =[
"Very good",
"Good",
"Bad"
];