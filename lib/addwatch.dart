import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'main.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'main.dart';
class Addwatch extends StatefulWidget {
 
  @override
  _AddwatchState createState() => _AddwatchState();
}

class _AddwatchState extends State<Addwatch> {
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
 
  bool isConditionBlank = false;
  bool isPostedBlank = false;
  bool iswarrantyBlank = false;
  bool isStatusBlank = false;
  bool isPriceBlank = false;
  bool isCasethicknessBlank = false;
  bool isWaterresistantdepthBlank = false;
  bool isClasstypeBlank = false;
  bool isBandwidthBlank = false;
  bool isBatteryBlank= false;
  bool isColorBlank=false;
  var child;
  TextEditingController nameController = new TextEditingController();
  TextEditingController statusController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  TextEditingController colorController=new TextEditingController();
  TextEditingController casethicknessController = new TextEditingController();
  TextEditingController waterresistantdepthController = new TextEditingController();
  TextEditingController classtypeController = new TextEditingController();
  TextEditingController bandwidthController = new TextEditingController();
  TextEditingController conditionController = new TextEditingController();
  TextEditingController postedController = new TextEditingController();
  TextEditingController warrantyController = new TextEditingController();
    TextEditingController batteryController = new TextEditingController();
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
                                          
                                           prefixText: "Model - ",
                                            labelText:
                                                "Enter wristwatch model",
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
                                    SizedBox(height: 10,),
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
                                          controller:casethicknessController,
                                          decoration: InputDecoration(
                                             prefixText: "Case thickness - ",
                                              labelText:
                                                  "Enter Case thickness",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
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
                                          controller: waterresistantdepthController,
                                          decoration: InputDecoration(
                                          prefixText:  " Water resistant depth - ",
                                              labelText:
                                                  "Enter water resistant depth",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
                                    isWaterresistantdepthBlank
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
                                                  "Water resistant field is empty",
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
                                            right: 10,
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
                                              labelText: "Enter color",
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
                                          controller: classtypeController,
                                          decoration: InputDecoration(
                                              prefixText: "Class type - ",
                                              labelText:
                                                  "Enter Class type",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                         SizedBox(height: 10,),
                                    isClasstypeBlank
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
                                                  "Class type field is empty",
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
                                            right: 10,
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
                                          controller: bandwidthController,
                                          decoration: InputDecoration(
                                            prefixText:"Band width - ",
                                              labelText:
                                                  "Enter Band width",
                                              labelStyle: TextStyle(
                                                color: Colors.blue,
                                              ),
                                              border: InputBorder.none),
                                        )),
                                     
                               
                                          SizedBox(
                                      height: 10,
                                    ),
                                      DropDownField(
                                      controller: conditionController,
                                      enabled: true,
                                      items:condition,
                                    
                                      onValueChanged: (value){
                                        setState(() {
                                          selectStatus=value;
                                        });
                                      },
                                    ),
                                    SizedBox(height: 10,),
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
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } else if (statusController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = true;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } else if (priceController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = true;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } 
                                          else if (casethicknessController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=true;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } 
                                          else if (waterresistantdepthController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=true;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } 
                                          else if (classtypeController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=true;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } 
                                          else if (bandwidthController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=true;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } 
                                          else if (colorController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=true;
                                            isBatteryBlank=false;
                                            isConditionBlank=false;
                                          } 
                                          else if (batteryController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=true;
                                            isConditionBlank=false;
                                          } 
                                          else if (conditionController.text ==
                                              "") {
                                        isNameBlank = false;
                                            isStatusBlank = false;
                                            isPriceBlank = false;
                                            isCasethicknessBlank=false;
                                            isWaterresistantdepthBlank=false;
                                            isClasstypeBlank=false;
                                            isBandwidthBlank=false;
                                            isColorBlank=false;
                                            isBatteryBlank=false;
                                            isConditionBlank=true;
                                          } 
                                          
                              else {
                                            var payLoad = {
                                              'name': nameController.text,
                                              'price': priceController.text,
                                              'case_thickness': casethicknessController.text,
                                              'water_resistant_depth': waterresistantdepthController.text,
                                              'class_type': classtypeController.text,
                                              'band_width':  bandwidthController.text,
                                              'battery_backup': batteryController.text,
                                              'color': colorController.text,
                                             'status': statusController.text,
                                              'product_condition':   conditionController.text,
                                              'warranty':warrantyController.text,
                                            };
                                            print("hit");
                                            sendWatchInfo(payLoad);
                                            wristwatchList.add(payLoad);
                                  
                                          }
                                        }
                                        );
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
   Future sendWatchInfo(payLoad) async {
    print("hit");
    final response = await http.post(watchEndPoint, body: payLoad);
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
"New arrival",

];
String selectCondition="";
List<String> condition =[
"Very good",
"Good",
"Bad",];