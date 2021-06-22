import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:admin_ecommerce/main.dart';
import 'package:admin_ecommerce/productlist.dart';

import 'package:share/share.dart';

class DetailsPage extends StatefulWidget {
  final mobileDetails;
  final relatedList;
  DetailsPage(this.mobileDetails, this.relatedList);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Slider(value: null, onChanged: null),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List sliderPic = [];

  List sliderList = [
    {"id": "1", "picture": "assets/xiaomimia3.jpg"},
    {"id": "1", "picture": "assets/xiaomimia3back.jpg"},
    {"id": "2", "picture": "assets/xiaomiminote10Pro.jpg"},
    {"id": "2", "picture": "assets/xiaomiminote10proback.jpg"},
    {"id": "3", "picture": "assets/redmi9afront.jpg"},
    {"id": "3", "picture": "assets/redmi9a.jpg"},
  ];

  @override
  initState() {
    super.initState();

    setState(() {
      for (int i = 0; i < sliderList.length; i++) {
        if (widget.mobileDetails["id"].toString() == sliderList[i]["id"]) {
          sliderPic.add(sliderList[i]["picture"]);
        }
      }
    });

    print("sliderPic");
    print(sliderPic);
  }

  int pageIndex = 0;
  bool isFav = false;
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          title: Text(
            "Details",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
                fontWeight: FontWeight.w300),
          ),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: sliderPic.map((i) {
                        return new Builder(builder: (BuildContext context) {
                          return new Container(
                            width: MediaQuery.of(context).size.width,
                            margin: new EdgeInsets.symmetric(horizontal: 3.0),
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            decoration: new BoxDecoration(color: Colors.white),
                            child: new GestureDetector(
                              child: Image.asset(
                                i,
                              ),
                              onTap: () {
                                //Navigator.push(context,MaterialPageRoute(builder: (context)=>Show (url:i)));
                              },
                            ),
                          );
                        });
                      }).toList(),
                      height: 250.0,
                      autoPlay: true,
                      onPageChanged: (value) {
                        setState(() {
                          pageIndex = value;
                        });
                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.grey[700]),
                              margin: EdgeInsets.only(right: 30),
                              padding: EdgeInsets.all(5),
                              child: Text(
                                "${pageIndex + 1}/${sliderPic.length}",
                                style: TextStyle(color: Colors.white,),
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CarouselIndicator(
                  count: sliderPic.length,
                  index: pageIndex,
                  color: Colors.grey,
                  activeColor: Colors.blue,
                  height: 7,
                  width: 7,

                ),
                Column(children: [
                  Card(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    // margin: EdgeInsets.only(right: 210),
                   elevation: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Container(
                              //   padding: EdgeInsets.only(
                              //       top: 10, bottom: 10, left: 20),

                              // ),
                              Container(
                                padding: EdgeInsets.only(
                                    right: 20, left: 20, top: 10, bottom: 10),
                                child: Text(
                                  "${widget.mobileDetails['price']}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w300),
                                ),
                              ),
                            ],
                          ),
                        ),
                 
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.1,color: Colors.grey[700]),
                    color: Colors.white,
                    
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 20, right: 10, bottom: 15, top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              right: 0, left: 0, top: 10, bottom: 8),
                          child: Text(
                            "Product Information",
                            style: TextStyle(color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Model:${widget.mobileDetails['name']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Available Color:${widget.mobileDetails['color']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Display:${widget.mobileDetails['size']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Front camera:${widget.mobileDetails['front_camera']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                              Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Rear camera:${widget.mobileDetails['rear_camera']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                                   Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Processor:${widget.mobileDetails['processor']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300,),
                            )),
                              Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Rom :${widget.mobileDetails['rom']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Ram:${widget.mobileDetails['ram']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Battery:${widget.mobileDetails['battery']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Status:${widget.mobileDetails['status']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Condition:${widget.mobileDetails['condition']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Posted:${widget.mobileDetails['posted']}",maxLines:4 ,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                        Container(
                            padding: EdgeInsets.only(
                                right: 0, left: 0, top: 0, bottom: 8),
                            child: Text(
                              "Warranty:${widget.mobileDetails['warranty']}",maxLines: 4,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13,fontWeight: FontWeight.w300),
                            )),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Share.share("Share text");
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    margin: EdgeInsets.only(left: 120, right: 120),
                    elevation: 1,
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10, top: 20, bottom: 20, right: 10)),
                        Container(
                          child: Icon(
                            Icons.share,
                            size: 15,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Text(
                            "Share",
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  margin: EdgeInsets.only(left: 20, right: 20,bottom: 10),
               
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.only(left: 15, right: 10, top: 50),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 94),
                              child: Text(
                                "Related Products",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "${widget.relatedList.length - 1} Products",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 11),
                              ),
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 10, bottom: 10, right: 10),
                          child: Row(
                              children: List.generate(widget.relatedList.length,
                                  (index) {
                            return widget.mobileDetails['name'] ==
                                    widget.relatedList[index]["name"]
                                ? Container()
                                : GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailsPage(
                                                  widget.relatedList[index],
                                                  widget.relatedList)));
                                    },
                                    child: Container(
                                      width: 130,
                                      height: 180,
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                        margin: EdgeInsets.only(left: 8,right: 8,bottom: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: Colors.black, width: 0.2)),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.only(
                                                top: 10, bottom: 5),
                                            child: Image.asset(
                                              "${widget.relatedList[index]['pic']}",
                                              height: 120,
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              "${widget.relatedList[index]['name']}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.black45,
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          Container(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: Text(
                                              "${widget.relatedList[index]['price']}",
                                              style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                          })),
                        ),
                      ),

                      // SizedBox(width: 5,);
                      //  Container(
                      //   padding: EdgeInsets.only(left: 5,right: 5),

                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     border: Border.all(color: Colors.black,width: 0.2)
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         padding: EdgeInsets.only(top: 10,bottom: 10),
                      //         child: Image.asset(
                      //       "assets/redmi7a.jpg",
                      //       height: 120,),),
                      //      Container(
                      //         padding: EdgeInsets.only(top: 5,bottom: 5),
                      //         child: Text(
                      //           "Model - Redmi7a",
                      //           style: TextStyle(
                      //             color: Colors.black45,
                      //             fontSize: 12,),),),
                      //         Container(
                      //         padding: EdgeInsets.only(top: 5,bottom: 5),
                      //         child: Text(
                      //           "Price-10,000",
                      //           style: TextStyle(
                      //             fontSize: 12, ),),),],),);
                    ],
                  ),
                ),
              ],
            )),
        bottomNavigationBar: Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 53,
            color: Colors.blue,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    //    userOrderList.add({
                    //             'id': orderLastID++,
                    //             'pic': widget.mobileDetails["pic"],
                    //             'name': widget.mobileDetails["name"],
                    //             'price': widget.mobileDetails["price"],
                    //             'size': widget.mobileDetails["size"],
                    //             'camera': widget.mobileDetails["camera"],
                    //             'ram': widget.mobileDetails["ram"],
                    //             'battery': widget.mobileDetails["battery"],
                    //             'rating': widget.mobileDetails["rating"],
                    //             'status': widget.mobileDetails["status"],
                    // });

                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 18, right: 18, top: 8, bottom: 8),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            "Purchase",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.blue, fontSize: 12),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}
