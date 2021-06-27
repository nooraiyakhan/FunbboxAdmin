import 'dart:convert';
import 'package:admin_ecommerce/addlaptop.dart';
import 'package:admin_ecommerce/addproduct.dart';
import 'package:admin_ecommerce/addwatch.dart';
import 'package:admin_ecommerce/detailspage.dart';
import 'package:admin_ecommerce/laptopdetailspage.dart';
import 'package:admin_ecommerce/wristwatchdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:admin_ecommerce/mainpage.dart';
import 'package:admin_ecommerce/laptopdetailspage.dart';
import 'package:admin_ecommerce/wristwatchdetailspage.dart';
// import 'package:second_project/laptopdetails.dart';

// import 'package:second_project/wristwatchdetails.dart';
import 'package:http/http.dart' as http;

import 'package:admin_ecommerce/main.dart';
class Productlist extends StatefulWidget {
  @override
  _ProductlistState createState() => _ProductlistState();
}
class _ProductlistState extends State<Productlist> {
  String selectedFilter = "All";
  String selectedFilter1 = "All";
  String selectedFilter2 = "All";
  bool isFilter = false, isFilter1 = false, isFilter2 = false;
  List filterList = ["All", "New", "Used"];
  List filterList1 = ["All", "New", "Used"];
  List filterList2 = ["All", "New Arrival"];
  List laptopitemList = [];
  List itemList = [];
  List wristwatchList = [];
  var mobileDetails;
  var laptoplistDetails;
  var wristwatchDetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMobile();
    fetchLaptop();
    fetchWatch();
  }
   fetchMobile() async {
    final response =
        await http.get(ipAddress);

    setState(() {
      mobileDetails = json.decode(response.body);
    });

    print(mobileDetails);

    for (int i = 0; i < mobileDetails.length; i++) {
      double rat = double.parse(mobileDetails[i]["rating"]);
      itemList.add(
        {
          'id': mobileDetails[i]["id"],
          'pic': mobileDetails[i]["pic"],
          'name': mobileDetails[i]["name"],
          'price': mobileDetails[i]["price"],
          'color': mobileDetails[i]["color"],
          'size': mobileDetails[i]["size"],
          'front_camera': mobileDetails[i]["front_camera"],
          'rear_camera': mobileDetails[i]["rear_camera"],
          'processor': mobileDetails[i]["processor"],
          'rom': mobileDetails[i]["rom"],
          'ram': mobileDetails[i]["ram"],
          'battery': mobileDetails[i]["battery"],
          'rating': rat,
          'status': mobileDetails[i]["status"],
          'condition': mobileDetails[i]["product_condition"],
          'posted': mobileDetails[i]["posted"],
          'warranty': mobileDetails[i]["warranty"],
        },
      );
    }
  }

  fetchLaptop() async {
    final response =
        await http.get(ipAddress1);

    setState(() {
      laptoplistDetails = json.decode(response.body);
    });

    print(laptoplistDetails);

    for (int i = 0; i < laptoplistDetails.length; i++) {
      double rat = double.parse(laptoplistDetails[i]["rating"]);
      laptopitemList.add(
        {
          'id': laptoplistDetails[i]["id"],
          'name': laptoplistDetails[i]["name"],
          'pic': laptoplistDetails[i]["pic"],
          'price': laptoplistDetails[i]["price"],
          'display': laptoplistDetails[i]["display"],
          'storage': laptoplistDetails[i]["storage"],
          'memory': laptoplistDetails[i]["memory"],
          'graphics': laptoplistDetails[i]["graphics"],
          'rating': rat,
          'status': laptoplistDetails[i]["status"],
          'condition': laptoplistDetails[i]["product_condition"],
          'processor': laptoplistDetails[i]["processor"],
          'battery': laptoplistDetails[i]["battery"],
          'posted': laptoplistDetails[i]["posted"],
          'warranty': laptoplistDetails[i]["warranty"],
        },
      );
    }
  }

  fetchWatch() async {
    final response =
        await http.get(ipAddress2);

    setState(() {
      wristwatchDetails = json.decode(response.body);
    });

    print(wristwatchDetails);

    for (int i = 0; i < wristwatchDetails.length; i++) {
      double rat = double.parse(wristwatchDetails[i]["rating"]);
      wristwatchList.add(
        {
          'id': wristwatchDetails[i]["id"],
          'pic': wristwatchDetails[i]["pic"],
          'name': wristwatchDetails[i]["name"],
          'price': wristwatchDetails[i]["price"],
          'case_thickness': wristwatchDetails[i]["case_thickness"],
          'water_resistant_depth': wristwatchDetails[i]
              ["water_resistant_depth"],
          'class_type': wristwatchDetails[i]["class_type"],
          'band_width': wristwatchDetails[i]["band_width"],
          'battery_backup': wristwatchDetails[i]["battery_backup"],
          'rating': rat,
          'status': wristwatchDetails[i]["status"],
          'condition': wristwatchDetails[i]["product_condition"],
          'posted': wristwatchDetails[i]["posted"],
          'warranty': wristwatchDetails[i]["warranty"],
        },
      );
    }
  }
  
  Future deleteLaptopInfo(payLoad) async {
    print("hit");
    final response = await http.post(delMobileEndPoint, body: payLoad);
    print("response");
    print(response);
    int statusCode = response.statusCode;
    print(statusCode);
    String bodyResponse = response.body;
    print(bodyResponse);
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: NestedScrollView(
                physics: BouncingScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      backgroundColor: Colors.white,
                      leading: InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            color: Colors.blue,
                          )),
                      title: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Fun",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  //SizedBox(width:5),

                                  Text(
                                    "Box",
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5,
                              height: 10,
                            ),
                            Container(
                              width: 50,
                              height: 2,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        )),
                      ),
                      actions: [
                        Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Icon(Icons.menu, color: Colors.white))
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.only(top: 20, right: 15, left: 15),
                        padding: EdgeInsets.only(left: 15, right: 15),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.search, size: 17, color: Colors.grey),
                            Flexible(
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                //controller: passController,
                                //obscureText: true,
                                autofocus: false,
                                style: TextStyle(
                                    color: Color(0xff003A5B).withOpacity(0.6),
                                    fontSize: 15,
                                    fontFamily: 'quicksand',
                                    fontWeight: FontWeight.w300),
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[700],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                  // labelStyle: TextStyle(
                                  //     color: Color(0xff003A5B),
                                  //     fontSize: 15,
                                  //     fontWeight: FontWeight.w500),
                                  // labelText: "Search",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ];
                },
                body: DefaultTabController(
                  length: 3,
                  child: Container(
                    child: Column(children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: new Material(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.all(0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: new TabBar(
                              isScrollable: false,
                              labelStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Colors.blue,
                              ),
                              tabs: [
                                Tab(
                                  //icon: Icon(Icons.phone_android),
                                  text: "Mobile",
                                ),
                                Tab(
                                  //icon: Icon(Icons.laptop),
                                  text: "Laptop",
                                ),
                                Tab(
                                  //icon: Icon(Icons.watch),
                                  text: "Watch",
                                ),
                              ],
                              indicatorColor: Colors.blue,
                              unselectedLabelColor: Color(0xff354D5B),
                              unselectedLabelStyle: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 14),
                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                      width: 1.5, color: Colors.blue),
                                  insets:
                                      EdgeInsets.symmetric(horizontal: 25.0)),
                              //labelPadding: EdgeInsets.only(left:40, right:40),
                              indicatorPadding:
                                  EdgeInsets.only(left: 30, right: 30),
                              labelColor: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            ////////// Mobile Section////////////
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                //for filter & list
                                children: <Widget>[
                                  SizedBox(height: 15,),
                                  GestureDetector(
                                    child: Container(
                                      height:50,
                                      color: Colors.blue,
                                      width:MediaQuery.of(context).size.width,
                                      child:
                                      Center(
                                        child: Text(
                                          "Add Product",style:TextStyle(color:Colors.white,fontSize: 18)
                                        ),
                                      )
                                    ),
                                    onTap: (){
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProduct()));
                                      });
                                    },
                                  ),
                                  // filter with click option
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isFilter == true) {
                                          isFilter = false;
                                        } else {
                                          isFilter = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          top: 10, left: 15, right: 15),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.grey
                                                  .withOpacity(0.3))),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  selectedFilter, //selected filter option
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                Icon(Icons.arrow_drop_down)
                                              ],
                                            ),
                                          ),
                                          isFilter == false
                                              ? Container()
                                              : Divider(),
                                          isFilter == false
                                              ? Container()
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      filterList.length,
                                                      (index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedFilter =
                                                              filterList[index];
                                                          isFilter = false;
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5,
                                                                bottom: 5),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          filterList[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      child: Column(
                                    children:
                                        List.generate(itemList.length, (index) {
                                      return selectedFilter == "All"
                                          ? GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            DetailsPage(
                                                                itemList[index],
                                                                itemList)));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 5,
                                                    bottom: 5),
                                                padding: EdgeInsets.all(10),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "${itemList[index]['pic']}",
                                                      height: 100,
                                                      width: 80,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        //margin: EdgeInsets.only(left: 15),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            right:
                                                                                0),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Text(
                                                                      "${itemList[index]['name']}",
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                5),
                                                                    decoration: BoxDecoration(
                                                                        color: itemList[index]['status'] ==
                                                                                'Used'
                                                                            ? Colors
                                                                                .grey
                                                                            : Colors
                                                                                .blue,
                                                                        borderRadius:
                                                                            BorderRadiusDirectional.circular(
                                                                                5)),
                                                                    child: Text(
                                                                        "${itemList[index]['status']}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                                fontWeight: FontWeight.w300,
                                                                            fontSize: 10)))
                                                              ],
                                                            ),
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Text(
                                                                  "Price - ${itemList[index]['price']}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12,
                                                                          fontWeight: FontWeight.w300),
                                                                )),
                                                                Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "${itemList[index]['size']}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                              fontWeight: FontWeight.w300,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      "${itemList[index]['front_camera']}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      "${itemList[index]['rear_camera']}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        " | ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.blue,
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${itemList[index]['processor']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      "${itemList[index]['rom']}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    ),
                                                                    Text(
                                                                      "${itemList[index]['color']}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Text(
                                                                      "${itemList[index]['ram']}",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.grey.withOpacity(
                                                                              0.7),
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        " | ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.blue,
                                                                            fontSize: 12),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${itemList[index]['battery']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      top: 5,
                                                                      left: 8),
                                                              child: Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              5),
                                                                  child:
                                                                      RatingBar(
                                                                    initialRating:
                                                                        itemList[index]
                                                                            [
                                                                            'rating'],
                                                                    minRating:
                                                                        1,
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    allowHalfRating:
                                                                        true,
                                                                    ignoreGestures:
                                                                        true,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        18,
                                                                    itemPadding:
                                                                        EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                0.1),
                                                                               

                                                                    // itemBuilder:
                                                                    //     (context,
                                                                    //             _) =>
                                                                    //         Icon(
                                                                    //   Icons
                                                                    //       .star,
                                                                    //   color: Colors
                                                                    //       .amber,
                                                                    //   size: 15,
                                                                    // ),
                                                                    // onRatingUpdate:
                                                                    //     (rating) {
                                                                    //   print(
                                                                    //       rating);
                                                                    // },
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          : itemList[index]['status'] ==
                                                  selectedFilter
                                              ? GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailsPage(
                                                                    itemList[
                                                                        index],
                                                                    itemList)));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        right: 15,
                                                        top: 5,
                                                        bottom: 5),
                                                    padding: EdgeInsets.all(10),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Image.asset(
                                                          "${itemList[index]['pic']}",
                                                          height: 100,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            //margin: EdgeInsets.only(left: 15),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.only(right: 0),
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                15),
                                                                        child:
                                                                            Text(
                                                                          "${itemList[index]['name']}",
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.grey,
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                5),
                                                                        decoration: BoxDecoration(
                                                                            color: itemList[index]['status'] == 'Used'
                                                                                ? Colors
                                                                                    .grey[700]
                                                                                : Colors
                                                                                    .blue,
                                                                            borderRadius: BorderRadiusDirectional.circular(
                                                                                5)),
                                                                        child: Text(
                                                                            "${itemList[index]['status']}",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w300)))
                                                                  ],
                                                                ),
                                                                Container(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Text(
                                                                      "Price - ${itemList[index]['price']}",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    )),
                                                                Container(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Text(
                                                                          "${itemList[index]['size']}",
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.grey.withOpacity(0.7),
                                                                              fontSize: 12,fontWeight: FontWeight.w300),
                                                                        ),
                                                                        Text(
                                                                          " | ",
                                                                          style: TextStyle(
                                                                              color: Colors.blue,
                                                                              fontSize: 12),
                                                                        ),
                                                                        Text(
                                                                          "${itemList[index]['camera']}",
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.grey.withOpacity(0.7),
                                                                              fontSize: 12,fontWeight: FontWeight.w300),
                                                                        ),
                                                                        Text(
                                                                          " | ",
                                                                          style: TextStyle(
                                                                              color: Colors.blue,
                                                                              fontSize: 12,fontWeight: FontWeight.w300),
                                                                        ),
                                                                        Text(
                                                                          "${itemList[index]['ram']}",
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.grey.withOpacity(0.7),
                                                                              fontSize: 12,fontWeight: FontWeight.w300),
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Text(
                                                                            " | ",
                                                                            style:
                                                                                TextStyle(color: Colors.blue, fontSize: 12),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${itemList[index]['battery']}",
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12,fontWeight: FontWeight.w300),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )),
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: 5,
                                                                        left:
                                                                            8),
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(left: 5),
                                                                        child: Container(
                                                                          margin: EdgeInsets.only(
                                                                              top: 5,
                                                                              left: 8),
                                                                          child: Container(
                                                                              margin: EdgeInsets.only(left: 5),
                                                                              child: RatingBar(
                                                                                initialRating: itemList[index]['rating'],
                                                                                minRating: 1,
                                                                                direction: Axis.horizontal,
                                                                                allowHalfRating: true,
                                                                                ignoreGestures: true,
                                                                                itemCount: 5,
                                                                                itemSize: 18,
                                                                                itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                                                                                // itemBuilder: (context, _) => Icon(
                                                                                //   Icons.star,
                                                                                //   color: Colors.amber,
                                                                                //   size: 15,
                                                                                // ),
                                                                                // onRatingUpdate: (rating) {
                                                                                //   print(rating);
                                                                                // },
                                                                              )),
                                                                        )))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container();
                                    }),
                                  )),
                                ],
                              ),
                            ),

                            //Laptop section//
                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                //for filter & list
                                children: <Widget>[
                                        SizedBox(height: 15,),
                                  GestureDetector(
                                    child: Container(
                                      height:50,
                                      color: Colors.blue,
                                      width:MediaQuery.of(context).size.width,
                                      child:
                                      Center(
                                        child: Text(
                                          "Add Product",style:TextStyle(color:Colors.white,fontSize: 18)
                                        ),
                                      )
                                    ),
                                    onTap: (){
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddLaptop()));
                                      });
                                    },
                                  ),
                                  // filter with click option
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (isFilter1 == true) {
                                          isFilter1 = false;
                                        } else {
                                          isFilter1 = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: EdgeInsets.only(
                                          top: 10, left: 15, right: 15),
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.5,
                                              color: Colors.grey
                                                  .withOpacity(0.3))),
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  selectedFilter1, //selected filter option
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                                Icon(Icons.arrow_drop_down)
                                              ],
                                            ),
                                          ),
                                          isFilter1 == false
                                              ? Container()
                                              : Divider(),
                                          isFilter1 == false
                                              ? Container()
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      filterList1.length,
                                                      (index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedFilter1 =
                                                              filterList1[
                                                                  index];
                                                          isFilter1 = false;
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5,
                                                                bottom: 5),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          filterList1[index],
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      child: Column(
                                    children: List.generate(
                                        laptopitemList.length, (index) {
                                      return selectedFilter1 == "All"
                                          //first list for laptop
                                          ? GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LaptopdetailsPage(
                                                                laptopitemList[
                                                                    index],
                                                                laptopitemList)));
                                              },
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 15,
                                                    right: 15,
                                                    top: 5,
                                                    bottom: 5),
                                                padding: EdgeInsets.all(10),
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.grey
                                                            .withOpacity(0.1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Image.asset(
                                                      "${laptopitemList[index]['pic']}",
                                                      height: 100,
                                                      width: 80,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        //margin: EdgeInsets.only(left: 15),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets
                                                                        .only(
                                                                            right:
                                                                                0),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Text(
                                                                      "${laptopitemList[index]['name']}",
                                                                      maxLines:
                                                                          2,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(
                                                                                5),
                                                                    decoration: BoxDecoration(
                                                                        color: laptopitemList[index]['status'] ==
                                                                                'Used'
                                                                            ? Colors
                                                                                .grey
                                                                            : Colors
                                                                                .blue,
                                                                        borderRadius:
                                                                            BorderRadiusDirectional.circular(
                                                                                5)),
                                                                    child: Text(
                                                                        "${laptopitemList[index]['status']}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            fontSize: 10,fontWeight: FontWeight.w300)))
                                                              ],
                                                            ),
                                                            GestureDetector(
                                                              onTap: (){
                                                                setState(() {
                                                                  laptopitemList.removeAt(index);
                                                                  print(laptopitemList[index]['id']);
                                                                });
                                                                deleteLaptopInfo({"id":laptopitemList[index]['id'].toString()});
                                                              },
                                                              child: Container(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                                  5),
                                                                      decoration: BoxDecoration(
                                                                          color: Colors
                                                                                  .redAccent,
                                                                          borderRadius:
                                                                              BorderRadiusDirectional.circular(
                                                                                  5)),
                                                                      child: Text(
                                                                          "Delete",
                                                                          style: TextStyle(
                                                                              color:
                                                                                  Colors.white,
                                                                              fontSize: 10,fontWeight: FontWeight.w300))),
                                                            ),
                                                              
                                                            
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Text(
                                                                  "Price - ${laptopitemList[index]['price']}/-",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .grey,
                                                                      fontSize:
                                                                          12,fontWeight: FontWeight.w300),
                                                                )),
                                                            Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['display']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['storage']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['memory']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          Text(
                                                                        " | ",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.blue,
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['graphics']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )),
                                                                   Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['processor']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['battery']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                  
                                                                  ],
                                                                )),
                                                            // Container(
                                                            //   margin: EdgeInsets
                                                            //       .only(
                                                            //           top: 5,
                                                            //           left: 8),
                                                            //   child: Container(
                                                            //       margin: EdgeInsets
                                                            //           .only(
                                                            //               left:
                                                            //                   5),
                                                            //       child:
                                                            //           RatingBar(
                                                            //         initialRating:
                                                            //             itemList[index]
                                                            //                 [
                                                            //                 'rating'],
                                                            //         minRating:
                                                            //             1,
                                                            //         direction: Axis
                                                            //             .horizontal,
                                                            //         allowHalfRating:
                                                            //             true,
                                                            //         ignoreGestures:
                                                            //             true,
                                                            //         itemCount:
                                                            //             5,
                                                            //         itemSize:
                                                            //             18,
                                                            //         itemPadding:
                                                            //             EdgeInsets.symmetric(
                                                            //                 horizontal:
                                                            //                     0.1),
                                                            //         itemBuilder:
                                                            //             (context,
                                                            //                     _) =>
                                                            //                 Icon(
                                                            //           Icons
                                                            //               .star,
                                                            //           color: Colors
                                                            //               .amber,
                                                            //           size: 15,
                                                            //         ),
                                                            //         onRatingUpdate:
                                                            //             (rating) {
                                                            //           print(
                                                            //               rating);
                                                            //         },
                                                            //       )),
                                                            // )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          //2nd list for laptop
                                          : laptopitemList[index]['status'] ==
                                                  selectedFilter1
                                              ? GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                LaptopdetailsPage(
                                                                    laptopitemList[
                                                                        index],
                                                                    laptopitemList)));
                                                  },
                                                  child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        right: 15,
                                                        top: 5,
                                                        bottom: 5),
                                                    padding: EdgeInsets.all(10),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Image.asset(
                                                          "${laptopitemList[index]['pic']}",
                                                          height: 100,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            //margin: EdgeInsets.only(left: 15),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.only(right: 0),
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                15),
                                                                        child:
                                                                            Text(
                                                                          "${laptopitemList[index]['name']}",
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.grey,
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets.all(
                                                                                5),
                                                                        decoration: BoxDecoration(
                                                                            color: laptopitemList[index]['status'] == 'Used'
                                                                                ? Colors
                                                                                    .grey
                                                                                : Colors
                                                                                    .blue,
                                                                            borderRadius: BorderRadiusDirectional.circular(
                                                                                5)),
                                                                        child: Text(
                                                                            "${laptopitemList[index]['status']}",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w300)))
                                                                  ],
                                                                ),
                                                                Container(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Text(
                                                                      "Price - ${laptopitemList[index]['price']}/-",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              12,fontWeight: FontWeight.w300),
                                                                    )),
                                                                Container(
                                                                    padding: EdgeInsets.only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${laptopitemList[index]['display']}",
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12,fontWeight: FontWeight.w300),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          " | ",
                                                                          style: TextStyle(
                                                                              color: Colors.blue,
                                                                              fontSize: 12),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${laptopitemList[index]['storage']}",
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12,fontWeight: FontWeight.w300),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          " | ",
                                                                          style: TextStyle(
                                                                              color: Colors.blue,
                                                                              fontSize: 12),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${laptopitemList[index]['memory']}",
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12,fontWeight: FontWeight.w300),
                                                                          ),
                                                                        ),
                                                                        Center(
                                                                          child:
                                                                              Text(
                                                                            " | ",
                                                                            style:
                                                                                TextStyle(color: Colors.blue, fontSize: 12),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${laptopitemList[index]['graphics']}",
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            style:
                                                                                TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12,fontWeight: FontWeight.w300),
                                                                          ),
                                                                        ),
                                                                        
                                                                      ],
                                                                    )),
                                                                     Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right:
                                                                            0,
                                                                        top:
                                                                            10),
                                                                margin: EdgeInsets
                                                                    .only(
                                                                        left:
                                                                            15),
                                                                child: Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['processor']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      " | ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .blue,
                                                                          fontSize:
                                                                              12),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Text(
                                                                        "${laptopitemList[index]['battery']}",
                                                                        maxLines:
                                                                            1,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey.withOpacity(0.7),
                                                                            fontSize: 12,fontWeight: FontWeight.w300),
                                                                      ),
                                                                    ),
                                                                  
                                                                  ],
                                                                )),
                                                                Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: 5,
                                                                        left:
                                                                            8),
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(left: 5),
                                                                        child: Container(
                                                                          margin: EdgeInsets.only(
                                                                              top: 5,
                                                                              left: 8),
                                                                          child: Container(
                                                                              margin: EdgeInsets.only(left: 5),
                                                                              child: RatingBar(
                                                                                initialRating: laptopitemList[index]['rating'],
                                                                                minRating: 1,
                                                                                direction: Axis.horizontal,
                                                                                allowHalfRating: true,
                                                                                ignoreGestures: true,
                                                                                itemCount: 5,
                                                                                itemSize: 18,
                                                                                itemPadding: EdgeInsets.symmetric(horizontal: 0.1),
                                                                                // itemBuilder: (context, _) => Icon(
                                                                                //   Icons.star,
                                                                                //   color: Colors.amber,
                                                                                //   size: 15,
                                                                                // ),
                                                                                // onRatingUpdate: (rating) {
                                                                                //   print(rating);
                                                                                // },
                                                                              )),
                                                                        )))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : Container();
                                    }),
                                  )),
                                ],
                              ),
                            ),
                            //watch section//

                            SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                  // for laptop filter & list
                                  children: <Widget>[
                                          SizedBox(height: 15,),
                                  GestureDetector(
                                    child: Container(
                                      height:50,
                                      color: Colors.blue,
                                      width:MediaQuery.of(context).size.width,
                                      child:
                                      Center(
                                        child: Text(
                                          "Add Product",style:TextStyle(color:Colors.white,fontSize: 18)
                                        ),
                                      )
                                    ),
                                    onTap: (){
                                      setState(() {
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Addwatch()));
                                      });
                                    },
                                  ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (isFilter2 == true) {
                                            isFilter2 = false;
                                          } else {
                                            isFilter2 = true;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.only(
                                            top: 10, left: 15, right: 15),
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.grey
                                                    .withOpacity(0.3))),
                                        child: Column(children: <Widget>[
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  selectedFilter2,
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w300,
                                                  ),
                                                ),
                                                Icon(Icons.arrow_drop_down)
                                              ],
                                            ),
                                          ),
                                          isFilter2 == false
                                              ? Container()
                                              : Divider(),
                                          isFilter2 == false
                                              ? Container()
                                              : Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: List.generate(
                                                      filterList2.length,
                                                      (index) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedFilter2 =
                                                              filterList2[
                                                                  index];
                                                          isFilter2 = false;
                                                        });
                                                      },
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 5,
                                                                bottom: 5),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Text(
                                                          filterList2[index],
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }))
                                        ]),
                                      ),
                                    ),
                                    Container(
                                        child: Column(
                                      children: List.generate(
                                          wristwatchList.length, (index) {
                                        return selectedFilter2 == "All"
                                            ? GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              WristwatchdetailsPage(
                                                                  wristwatchList[
                                                                      index],
                                                                  wristwatchList)));
                                                },
                                                child: Container(
                                                    margin: EdgeInsets.only(
                                                        left: 15,
                                                        right: 15,
                                                        top: 5,
                                                        bottom: 5),
                                                    padding: EdgeInsets.all(10),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                    0.1)),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Image.asset(
                                                            "${wristwatchList[index]['pic']}",
                                                            height: 100,
                                                            width: 80,
                                                          ),
                                                          Expanded(
                                                              child: Container(
                                                                  //margin: EdgeInsets.only(left: 15),
                                                                  child: Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: <
                                                                          Widget>[
                                                                Row(
                                                                  children: <
                                                                      Widget>[
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        padding:
                                                                            EdgeInsets.only(right: 0),
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                15),
                                                                        child:
                                                                            Text(
                                                                          "${wristwatchList[index]['name']}",
                                                                          maxLines:
                                                                              2,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style: TextStyle(
                                                                              color: Colors.grey,
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.bold),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      decoration: BoxDecoration(
                                                                          color: wristwatchList[index]['status'] == 'New Arrival'
                                                                              ? Colors.grey
                                                                              : Colors.blue,
                                                                          borderRadius: BorderRadiusDirectional.circular(5)),
                                                                      child:
                                                                          Text(
                                                                        "${wristwatchList[index]['status']}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                                fontWeight: FontWeight.w300,
                                                                            fontSize: 10),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Container(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .only(
                                                                    right: 0,
                                                                    top: 10,
                                                                  ),
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              15),
                                                                  child: Text(
                                                                    "Price - ${wristwatchList[index]['price']}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                            fontWeight: FontWeight.w300,
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                                ),
                                                                Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .only(
                                                                      right: 0,
                                                                      top: 10,
                                                                    ),
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                15),
                                                                    child: Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              "${wristwatchList[index]['case_thickness']}",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                color: Colors.grey.withOpacity(0.7),fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "|",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.blue,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              "${wristwatchList[index]['water_resistant_depth']}",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                color: Colors.grey.withOpacity(0.7),fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "|",
                                                                            style:
                                                                                TextStyle(color: Colors.blue, fontSize: 12),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              "${wristwatchList[index]['class_type']}",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                color: Colors.grey.withOpacity(0.7),fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "|",
                                                                            style:
                                                                                TextStyle(color: Colors.blue, fontSize: 12),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Text(
                                                                              "${wristwatchList[index]['band_width']}",
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(
                                                                                color: Colors.grey.withOpacity(0.7),
                                                                                fontWeight: FontWeight.w300,
                                                                                fontSize: 12,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ])),
                                                                Container(
                                                                  margin:
                                                                      EdgeInsets
                                                                          .only(
                                                                    top: 5,
                                                                    left: 8,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                5),
                                                                    child:
                                                                        RatingBar(
                                                                      initialRating:
                                                                          wristwatchList[index]
                                                                              [
                                                                              'rating'],
                                                                      minRating:
                                                                          1,
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      allowHalfRating:
                                                                          true,
                                                                      ignoreGestures:
                                                                          true,
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          18,
                                                                      itemPadding:
                                                                          EdgeInsets.symmetric(
                                                                              horizontal: 0.1),
                                                                              
                                                                      // itemBuilder:
                                                                      //     (context, _) =>
                                                                      //         Icon(
                                                                      //   Icons
                                                                      //       .star,
                                                                      //   color: Colors
                                                                      //       .amber,
                                                                      //   size:
                                                                      //       15,
                                                                      // ),
                                                                      onRatingUpdate:
                                                                          (rating) {
                                                                        print(
                                                                            rating);
                                                                      },
                                                                    ),
                                                                  ),
                                                                )
                                                              ])))
                                                        ])),
                                              )
                                            : wristwatchList[index]['status'] ==
                                                    selectedFilter2
                                                ? GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  WristwatchdetailsPage(
                                                                      wristwatchList[
                                                                          index],
                                                                      wristwatchList)));
                                                    },
                                                    child: Container(
                                                        margin: EdgeInsets.only(
                                                            left: 15,
                                                            right: 15,
                                                            top: 5,
                                                            bottom: 5),
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        width:
                                                            MediaQuery.of(context)
                                                                .size
                                                                .width,
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Colors
                                                                    .grey
                                                                    .withOpacity(
                                                                        0.1)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: <Widget>[
                                                              Image.asset(
                                                                "${wristwatchList[index]['pic']}",
                                                                height: 100,
                                                              ),
                                                              Expanded(
                                                                  child:
                                                                      Container(
                                                                          //margin: EdgeInsets.only(left: 15),
                                                                          child: Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: <Widget>[
                                                                    Row(
                                                                      children: <
                                                                          Widget>[
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            padding:
                                                                                EdgeInsets.only(right: 0),
                                                                            margin:
                                                                                EdgeInsets.only(left: 15),
                                                                            child:
                                                                                Text(
                                                                              "${wristwatchList[index]['name']}",
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                              style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(5),
                                                                          decoration: BoxDecoration(
                                                                              color: wristwatchList[index]['status'] == 'New Arrival' ? Colors.grey : Colors.blue,
                                                                              borderRadius: BorderRadiusDirectional.circular(5)),
                                                                          child:
                                                                              Text(
                                                                            "${wristwatchList[index]['status']}",
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.w300),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .only(
                                                                        right:
                                                                            0,
                                                                        top: 10,
                                                                      ),
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              15),
                                                                      child:
                                                                          Text(
                                                                        "price - ${wristwatchList[index]['price']}/-",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                                fontWeight: FontWeight.w300,
                                                                            fontSize: 12),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        padding:
                                                                            EdgeInsets
                                                                                .only(
                                                                          right:
                                                                              0,
                                                                          top:
                                                                              10,
                                                                        ),
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                15),
                                                                        child: Row(
                                                                            children: <Widget>[
                                                                              Expanded(
                                                                                child: Text(
                                                                                  "${wristwatchList[index]['case_thickness']}",
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey.withOpacity(0.7),
                                                                                    fontSize: 12,fontWeight: FontWeight.w300,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "|",
                                                                                style: TextStyle(
                                                                                  color: Colors.blue,
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  "${wristwatchList[index]['water_resistant_depth']}",
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey.withOpacity(0.7),fontWeight: FontWeight.w300,
                                                                                    fontSize: 12,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "|",
                                                                                style: TextStyle(color: Colors.blue, fontSize: 12),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  "${wristwatchList[index]['class_type']}",
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey.withOpacity(0.7),
                                                                                    fontSize: 12,fontWeight: FontWeight.w300
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                "|",
                                                                                style: TextStyle(color: Colors.blue, fontSize: 12),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  "${wristwatchList[index]['band_width']}",
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey.withOpacity(0.7),
                                                                                    fontSize: 12,fontWeight: FontWeight.w300
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                                Text(
                                                                                "|",
                                                                                style: TextStyle(color: Colors.blue, fontSize: 12),
                                                                              ),
                                                                              Expanded(
                                                                                child: Text(
                                                                                  "${wristwatchList[index]['battery_backup']}",
                                                                                  maxLines: 1,
                                                                                  overflow: TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                    color: Colors.grey.withOpacity(0.7),
                                                                                    fontSize: 12,fontWeight: FontWeight.w300
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ])),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 5,
                                                                        left: 8,
                                                                      ),
                                                                      child:
                                                                          Container(
                                                                        margin: EdgeInsets.only(
                                                                            left:
                                                                                5),
                                                                        child:
                                                                            RatingBar(
                                                                          initialRating:
                                                                              wristwatchList[index]['rating'],
                                                                          minRating:
                                                                              1,
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          allowHalfRating:
                                                                              true,
                                                                          ignoreGestures:
                                                                              true,
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              18,
                                                                          itemPadding:
                                                                              EdgeInsets.symmetric(horizontal: 0.1),
                                                                          // itemBuilder: (context, _) =>
                                                                          //     Icon(
                                                                          //   Icons.star,
                                                                          //   color:
                                                                          //       Colors.amber,
                                                                          //   size:
                                                                          //       15,
                                                                          // ),
                                                                          // onRatingUpdate:
                                                                          //     (rating) {
                                                                          //   print(rating);
                                                                          // },
                                                                        ),
                                                                      ),
                                                                    )
                                                                  ])))
                                                            ])),
                                                  )
                                                : Container();
                                      }),
                                    ))
                                  ]),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ))),
       );
  }
}


// import 'dart:convert';
// import 'package:admin_ecommerce/addproduct.dart';
// import 'package:admin_ecommerce/addlaptop.dart';
// import 'package:admin_ecommerce/addwatch.dart';
// import 'package:admin_ecommerce/wristwatchdetailspage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// // import 'package:second_project/addresspage.dart';
// // import 'package:second_project/cart.dart';
// // import 'package:second_project/detailsPage.dart';
// // import 'package:second_project/favouritepage.dart';
// // import 'package:second_project/laptopdetails.dart';
// // import 'package:second_project/loginpage.dart';
// // import 'package:second_project/main.dart';
// // import 'package:second_project/order.dart';
// // import 'package:second_project/profile.dart';
// // import 'package:second_project/terms.dart';
// // import 'package:second_project/voucherpage.dart';
// // import 'package:second_project/wristwatchdetails.dart';
// import 'package:http/http.dart' as http;

// import 'detailspage.dart';
// import 'laptopdetailspage.dart';
// import 'main.dart';

// //import 'homepage.dart';
// class Productlist extends StatefulWidget {
//   @override
//   _ProductlistState createState() => _ProductlistState();
// }

// class _ProductlistState extends State<Productlist> {
//   String selectedFilter = "All";
//   String selectedFilter1 = "All";
//   String selectedFilter2 = "All";
//   bool isFilter = false, isFilter1 = false, isFilter2 = false;
//   List filterList = ["All", "New", "Used"];
//   List filterList1 = ["All", "New", "Used"];
//   List filterList2 = ["All", "New Arrival"];
//   List laptopitemList = [];
//   List itemList = [];
//   List wristwatchList = [];
//   var mobileDetails;
//   var laptoplistDetails;
//   var wristwatchDetails;
//   int index = 0;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     fetchMobile();
//     fetchLaptop();
//     fetchWatch();
//   }

//   fetchMobile() async {
//     final response = await http.get(ipAddress);

//     setState(() {
//       mobileDetails = json.decode(response.body);
//     });

//     print(mobileDetails);

//     for (int i = 0; i < mobileDetails.length; i++) {
//       double rat = double.parse(mobileDetails[i]["rating"]);
//       itemList.add(
//         {
//           'id': mobileDetails[i]["id"],
//           'pic': mobileDetails[i]["pic"],
//           'name': mobileDetails[i]["name"],
//           'price': mobileDetails[i]["price"],
//           'color': mobileDetails[i]["color"],
//           'size': mobileDetails[i]["size"],
         
//           'ram': mobileDetails[i]["ram"],
//           'battery': mobileDetails[i]["battery"],
//              'front_camera': mobileDetails[i]["front_camera"],
//           'rear_camera': mobileDetails[i]["rear_camera"],
//           'processor': mobileDetails[i]["processor"],
//           'rom': mobileDetails[i]["rom"],
//           'rating': rat,
//           'status': mobileDetails[i]["status"],
//           'condition': mobileDetails[i]["condition"],
//           'posted': mobileDetails[i]["posted"],
//           'warranty': mobileDetails[i]["warranty"],
//         },
//       );
//     }

//     lastId = mobileDetails.length == 0
//         ? 0
//         : mobileDetails[mobileDetails.length - 1]["id"];
//   }

//   fetchLaptop() async {
//     final response = await http.get(ipAddress1);

//     setState(() {
//       laptoplistDetails = json.decode(response.body);
//     });

//     print(laptoplistDetails);

//     for (int i = 0; i < laptoplistDetails.length; i++) {
//       double rat = double.parse(laptoplistDetails[i]["rating"]);
//       laptopitemList.add(
//         {
//           'id': laptoplistDetails[i]["id"],
//           'name': laptoplistDetails[i]["name"],
//           'pic': laptoplistDetails[i]["pic"],
//           'price': laptoplistDetails[i]["price"],
//           'display': laptoplistDetails[i]["display"],
//           'storage': laptoplistDetails[i]["storage"],
//           'memory': laptoplistDetails[i]["memory"],
//           'graphics': laptoplistDetails[i]["graphics"],
//           'rating': rat,
//           'status': laptoplistDetails[i]["status"],
//           'condition': laptoplistDetails[i]["condition"],
//           'posted': laptoplistDetails[i]["posted"],
//                    'processor': laptoplistDetails[i]["processor"],
//           'battery': laptoplistDetails[i]["battery"],
//           'warranty': laptoplistDetails[i]["warranty"],
//         },
//       );
//     }
//     lastId = laptoplistDetails.length == 0
//         ? 0
//         : laptoplistDetails[laptoplistDetails.length - 1]["id"];
//   }

//   fetchWatch() async {
//     final response = await http.get(ipAddress2);

//     setState(() {
//       wristwatchDetails = json.decode(response.body);
//     });

//     print(wristwatchDetails);

//     for (int i = 0; i < wristwatchDetails.length; i++) {
//       double rat = double.parse(wristwatchDetails[i]["rating"]);
//       wristwatchList.add(
//         {
//           'id': wristwatchDetails[i]["id"],
//           'pic': wristwatchDetails[i]["pic"],
//           'name': wristwatchDetails[i]["name"],
//           'price': wristwatchDetails[i]["price"],
//           'case_thickness': wristwatchDetails[i]["case_thickness"],
//           'water_resistant_depth': wristwatchDetails[i]
//               ["water_resistant_depth"],
//           'class_type': wristwatchDetails[i]["class_type"],
//           'band_width': wristwatchDetails[i]["band_width"],
//           'rating': rat,
//           'status': wristwatchDetails[i]["status"],
//           'condition': wristwatchDetails[i]["condition"],
//           'posted': wristwatchDetails[i]["posted"],
//            'battery_backup': wristwatchDetails[i]["battery_backup"],
//           'warranty': wristwatchDetails[i]["warranty"],
//         },
//       );
//     }
//     lastId = wristwatchList.length == 0
//         ? 0
//         : wristwatchList[wristwatchList.length - 1]["id"];
//   }

//   getDataResponse() async {
//     final res = await Navigator.push(
//         context, MaterialPageRoute(builder: (context) => AddProduct()));

//     if (res != null) {
//       setState(() {
//         itemList.add(res);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//           child: NestedScrollView(
//               physics: BouncingScrollPhysics(),
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return <Widget>[
//                   SliverAppBar(
//                     automaticallyImplyLeading: false,
//                     backgroundColor: Colors.white,
//                     // leading: InkWell(
//                     //     onTap: () {
//                     //       Scaffold.of(context).openDrawer();
//                     //     },
//                     //     child: Icon(
//                     //       Icons.menu,
//                     //       color: Colors.blue,
//                     //     )),
//                     title: Container(
//                       margin: EdgeInsets.only(top: 10),
//                       child: Center(
//                           child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Text(
//                                   "Fun",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.blue,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                                 //SizedBox(width:5),

//                                 Text(
//                                   "Box",
//                                   style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: 5,
//                             height: 10,
//                           ),
//                           Container(
//                             width: 50,
//                             height: 2,
//                             decoration: BoxDecoration(
//                                 color: Colors.blue,
//                                 borderRadius: BorderRadius.circular(5)),
//                           ),
//                         ],
//                       )),
//                     ),
//                     actions: [
//                       // Container(
//                       //     margin: EdgeInsets.only(right: 20),
//                       //     child: Icon(Icons.menu, color: Colors.white))
//                     ],
//                   ),
//                   SliverToBoxAdapter(
//                     child: Container(
//                       margin: EdgeInsets.only(top: 20, right: 15, left: 15),
//                       padding: EdgeInsets.only(left: 15, right: 15),
//                       decoration: BoxDecoration(
//                           color: Colors.grey.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Row(
//                         children: <Widget>[
//                           Icon(Icons.search, size: 17, color: Colors.grey),
//                           Flexible(
//                             child: TextField(
//                               onChanged: (value) {
//                                 setState(() {});
//                               },
//                               //controller: passController,
//                               //obscureText: true,
//                               autofocus: false,
//                               style: TextStyle(
//                                   color: Color(0xff003A5B).withOpacity(0.6),
//                                   fontSize: 15,
//                                   fontFamily: 'quicksand',
//                                   fontWeight: FontWeight.w500),
//                               decoration: InputDecoration(
//                                 hintText: "Search...",
//                                 hintStyle: TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500),
//                                 // labelStyle: TextStyle(
//                                 //     color: Color(0xff003A5B),
//                                 //     fontSize: 15,
//                                 //     fontWeight: FontWeight.w500),
//                                 // labelText: "Search",
//                                 contentPadding:
//                                     EdgeInsets.fromLTRB(12.0, 0, 12.0, 0),
//                                 border: InputBorder.none,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ];
//               },
//               body: DefaultTabController(
//                 length: 3,
//                 child: Container(
//                   child: Column(children: <Widget>[
//                     Container(
//                       margin: EdgeInsets.only(top: 10),
//                       child: new Material(
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           padding: EdgeInsets.all(0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                           ),
//                           child: new TabBar(
//                             isScrollable: false,
//                             labelStyle: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               color: Colors.blue,
//                             ),
//                             tabs: [
//                               Tab(
//                                 //icon: Icon(Icons.phone_android),
//                                 text: "Mobile",
//                               ),
//                               Tab(
//                                 //icon: Icon(Icons.laptop),
//                                 text: "Laptop",
//                               ),
//                               Tab(
//                                 //icon: Icon(Icons.watch),
//                                 text: "Watch",
//                               ),
//                             ],
//                             indicatorColor: Colors.blue,
//                             unselectedLabelColor: Color(0xff354D5B),
//                             unselectedLabelStyle: TextStyle(
//                                 fontWeight: FontWeight.w500, fontSize: 14),
//                             indicator: UnderlineTabIndicator(
//                                 borderSide:
//                                     BorderSide(width: 1.5, color: Colors.blue),
//                                 insets: EdgeInsets.symmetric(horizontal: 25.0)),
//                             //labelPadding: EdgeInsets.only(left:40, right:40),
//                             indicatorPadding:
//                                 EdgeInsets.only(left: 30, right: 30),
//                             labelColor: Colors.blue,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Expanded(
//                       child: TabBarView(
//                         children: <Widget>[
//                           ////////// Mobile Section////////////
//                           SingleChildScrollView(
//                             physics: BouncingScrollPhysics(),
//                             child: Column(
//                               //for filter & list
//                               children: <Widget>[
//                                 // filter with click option
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       getDataResponse();
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 50,
//                                     width: MediaQuery.of(context).size.width,
//                                     color: Colors.blue,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                             child: Icon(
//                                           Icons.add,
//                                           color: Colors.white,
//                                         )),
//                                         Container(
//                                           child: Text(
//                                             "Add product",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 20),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       if (isFilter == true) {
//                                         isFilter = false;
//                                       } else {
//                                         isFilter = true;
//                                       }
//                                     });
//                                   },
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     margin: EdgeInsets.only(
//                                         top: 10, left: 15, right: 15),
//                                     padding: EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         border: Border.all(
//                                             width: 0.5,
//                                             color:
//                                                 Colors.grey.withOpacity(0.3))),
//                                     child: Column(
//                                       children: <Widget>[
//                                         Container(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: <Widget>[
//                                               Text(
//                                                 selectedFilter, //selected filter option
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.normal),
//                                               ),
//                                               Icon(Icons.arrow_drop_down)
//                                             ],
//                                           ),
//                                         ),
//                                         isFilter == false
//                                             ? Container()
//                                             : Divider(),
//                                         isFilter == false
//                                             ? Container()
//                                             : Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: List.generate(
//                                                     filterList.length, (index) {
//                                                   return GestureDetector(
//                                                     onTap: () {
//                                                       setState(() {
//                                                         selectedFilter =
//                                                             filterList[index];
//                                                         isFilter = false;
//                                                       });
//                                                     },
//                                                     child: Container(
//                                                       padding: EdgeInsets.only(
//                                                           top: 5, bottom: 5),
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                               .size
//                                                               .width,
//                                                       child: Text(
//                                                         filterList[index],
//                                                         style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 15,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .normal),
//                                                       ),
//                                                     ),
//                                                   );
//                                                 }),
//                                               )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                     child: Column(
//                                         children: List.generate(itemList.length,
//                                             (index) {
//                                   return selectedFilter == "All"
//                                       ? GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         DetailsPage(
//                                                             itemList[index],
//                                                             itemList)));
//                                           },
//                                           child: GestureDetector(
//                                             onTap: () {
//                                               setState(() {
//                                                 address = itemList[index]
//                                                         ['name'] +
//                                                     ", " +
//                                                     itemList[index]['price'] +
//                                                     ", " +
//                                                     itemList[index]['color'] +
//                                                     ", " +
//                                                     itemList[index]['size'] +
//                                                     ", " +
//                                                         itemList[index]
//                                                             ['front_camera'] +
//                                                         ", " +
//                                                         itemList[index]['rear_camera'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['processor'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['rom'] +
//                                                     itemList[index]['ram'] +
//                                                     ", " +
//                                                     itemList[index]['battery'] +
//                                                     ", " +
//                                                     itemList[index]['status'] +
//                                                     ", " +
//                                                     itemList[index]
//                                                         ['condition'] +
//                                                     ", " +
//                                                     itemList[index]['posted'] +
//                                                     ", " +
//                                                     itemList[index]['warranty'];
//                                               });
//                                               Navigator.pop(context);
//                                             },
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   left: 15,
//                                                   right: 15,
//                                                   top: 5,
//                                                   bottom: 5),
//                                               padding: EdgeInsets.all(10),
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   border: Border.all(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.1)),
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   Image.asset(
//                                                     itemList[index]['pic'] ==
//                                                             null
//                                                         ? "assets/xiaomimia3.jpg"
//                                                         : "${itemList[index]['pic']}",
//                                                     height: 100,
//                                                     width: 80,
//                                                   ),
//                                                   Expanded(
//                                                     child: Container(
//                                                       //margin: EdgeInsets.only(left: 15),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: <Widget>[
//                                                           Padding(padding: EdgeInsets.only(right: 10)),
//                                                           Row(
//                                                             children: <Widget>[
//                                                               Expanded(
//                                                                 child:
//                                                                     Container(
//                                                                   padding: EdgeInsets
//                                                                       .only(
//                                                                           right:
//                                                                               0),
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               15),
//                                                                   child: Text(
//                                                                     "${itemList[index]['name']}",
//                                                                     maxLines: 2,
//                                                                     overflow:
//                                                                         TextOverflow
//                                                                             .ellipsis,
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .grey,
//                                                                         fontSize:
//                                                                             15,
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .all(
//                                                                               5),
//                                                                   decoration: BoxDecoration(
//                                                                       color: itemList[index]['status'] ==
//                                                                               'Used'
//                                                                           ? Colors
//                                                                               .grey
//                                                                           : Colors
//                                                                               .blue,
//                                                                       borderRadius:
//                                                                           BorderRadiusDirectional.circular(
//                                                                               5)),
//                                                                   child: Text(
//                                                                       "${itemList[index]['status']}",
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .white,
//                                                                           fontSize:
//                                                                               10)))
//                                                             ],
//                                                           ),
//                                                           Container(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       right: 0,
//                                                                       top: 10),
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       left: 15),
//                                                               child: Text(
//                                                                 "Price - ${itemList[index]['price']}/-",
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .grey,
//                                                                     fontSize:
//                                                                         12),
//                                                               )),
//                                                           Container(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       right: 0,
//                                                                       top: 10),
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       left: 15),
//                                                               child:
//                                                                Column(
//                                                                  children: [
//                                                                    Row(
//                                                                     children: <
//                                                                         Widget>[
//                                                                       Text(
//                                                                         "${itemList[index]['rom']}",
//                                                                         maxLines: 1,
//                                                                         overflow:
//                                                                             TextOverflow
//                                                                                 .ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey
//                                                                                 .withOpacity(
//                                                                                     0.7),
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Text(
//                                                                         " | ",
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .blue,
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                         Text(
//                                                                         "${itemList[index]['size']}",
//                                                                         maxLines: 1,
//                                                                         overflow:
//                                                                             TextOverflow
//                                                                                 .ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey
//                                                                                 .withOpacity(
//                                                                                     0.7),
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Text(
//                                                                         " | ",
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .blue,
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Text(
//                                                                         "${itemList[index]['front_camera']}",
//                                                                         maxLines: 1,
//                                                                         overflow:
//                                                                             TextOverflow
//                                                                                 .ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey
//                                                                                 .withOpacity(
//                                                                                     0.7),
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Text(
//                                                                         " | ",
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .blue,
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Text(
//                                                                         "${itemList[index]['rear_camera']}",
//                                                                         maxLines: 1,
//                                                                         overflow:
//                                                                             TextOverflow
//                                                                                 .ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey
//                                                                                 .withOpacity(
//                                                                                     0.7),
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Center(
//                                                                         child: Text(
//                                                                           " | ",
//                                                                           style: TextStyle(
//                                                                               color: Colors
//                                                                                   .blue,
//                                                                               fontSize:
//                                                                                   12),
//                                                                         ),
//                                                                       ),
//                                                                       Expanded(
//                                                                         child: Text(
//                                                                           "${itemList[index]['processor']}",
//                                                                           maxLines:
//                                                                               1,
//                                                                           overflow:
//                                                                               TextOverflow
//                                                                                   .ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey.withOpacity(
//                                                                                   0.7),
//                                                                               fontSize:
//                                                                                   12),
//                                                                         ),
//                                                                       ),
//                                                                       Text(
//                                                                         " | ",
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .blue,
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Text(
//                                                                         "${itemList[index]['rom']}",
//                                                                         maxLines: 1,
//                                                                         overflow:
//                                                                             TextOverflow
//                                                                                 .ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey
//                                                                                 .withOpacity(
//                                                                                     0.7),
//                                                                             fontSize:
//                                                                                 12),
//                                                                       ),
//                                                                       Center(
//                                                                         child: Text(
//                                                                           " | ",
//                                                                           style: TextStyle(
//                                                                               color: Colors
//                                                                                   .blue,
//                                                                               fontSize:
//                                                                                   12),
//                                                                         ),
//                                                                       ),
//                                                                       Expanded(
//                                                                         child: Text(
//                                                                           "${itemList[index]['battery']}",
//                                                                           maxLines:
//                                                                               1,
//                                                                           overflow:
//                                                                               TextOverflow
//                                                                                   .ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey.withOpacity(
//                                                                                   0.7),
//                                                                               fontSize:
//                                                                                   12),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                               ),
//                                                                  ],
//                                                                )),
//                                                           Container(
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       top: 5,
//                                                                       left: 8),
//                                                               child: Container(
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               5),
//                                                                   child: RatingBar
//                                                                       .builder(
//                                                                     initialRating:
//                                                                        0,
//                                                                     minRating:
//                                                                         1,
//                                                                     direction: Axis
//                                                                         .horizontal,
//                                                                     allowHalfRating:
//                                                                         true,
//                                                                     itemCount:
//                                                                         5,
//                                                                     // itemPadding:
//                                                                     //     EdgeInsets.symmetric(
//                                                                     //         horizontal:
//                                                                     //             1.0),
//                                                                     itemBuilder:
//                                                                         (context,
//                                                                                 _) =>
//                                                                             Icon(
//                                                                       Icons
//                                                                           .star,
//                                                                       color: Colors
//                                                                           .amber,
//                                                                     ),
//                                                                     onRatingUpdate:
//                                                                         (rating) {
//                                                                       print(
//                                                                           rating);
//                                                                     },
//                                                                   ))),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           ))
//                                       : itemList[index]['status'] ==
//                                               selectedFilter
//                                           ? GestureDetector(
//                                               onTap: () {
//                                                 Navigator.push(
//                                                     context,
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             DetailsPage(
//                                                                 itemList[index],
//                                                                 itemList)));
//                                               },
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   setState(() {
//                                                     address = itemList[index]
//                                                             ['name'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['price'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['color'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['size'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['front_camera'] +
//                                                         ", " +
//                                                         itemList[index]['rear_camera'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['processor'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['rom'] +
//                                                         ", " +    itemList[index]
//                                                             ['status'] +
//                                                         ", " +
//                                                         itemList[index]['ram'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['battery'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['status'] +
//                                                         itemList[index]
//                                                             ['condition'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['posted'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['warranty'];
//                                                   });
//                                                   Navigator.pop(context);
//                                                 },
//                                                 child: Container(
//                                                   margin: EdgeInsets.only(
//                                                       left: 15,
//                                                       right: 15,
//                                                       top: 5,
//                                                       bottom: 5),
//                                                   padding: EdgeInsets.all(10),
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       border: Border.all(
//                                                           color: Colors.grey
//                                                               .withOpacity(
//                                                                   0.1)),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5)),
//                                                   child: Row(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: <Widget>[
//                                                       Image.asset(
//                                                         "${itemList[index]['pic']}",
//                                                         height: 100,
//                                                         width: 80,
//                                                       ),
//                                                       Expanded(
//                                                         child: Container(
//                                                           //margin: EdgeInsets.only(left: 15),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: <Widget>[
//                                                               Row(
//                                                                 children: <
//                                                                     Widget>[
//                                                                   Expanded(
//                                                                     child:
//                                                                         Container(
//                                                                       padding: EdgeInsets.only(
//                                                                           right:
//                                                                               0),
//                                                                       margin: EdgeInsets.only(
//                                                                           left:
//                                                                               15),
//                                                                       child:
//                                                                           Text(
//                                                                         "${itemList[index]['name']}",
//                                                                         maxLines:
//                                                                             2,
//                                                                         overflow:
//                                                                             TextOverflow.ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey,
//                                                                             fontSize:
//                                                                                 15,
//                                                                             fontWeight:
//                                                                                 FontWeight.bold),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   Container(
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               5),
//                                                                       decoration: BoxDecoration(
//                                                                           color: itemList[index]['status'] == 'Used'
//                                                                               ? Colors
//                                                                                   .grey
//                                                                               : Colors
//                                                                                   .blue,
//                                                                           borderRadius: BorderRadiusDirectional.circular(
//                                                                               5)),
//                                                                       child: Text(
//                                                                           "${itemList[index]['status']}",
//                                                                           style: TextStyle(
//                                                                               color: Colors.white,
//                                                                               fontSize: 10)))
//                                                                 ],
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .only(
//                                                                           right:
//                                                                               0,
//                                                                           top:
//                                                                               10),
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               15),
//                                                                   child: Text(
//                                                                     "Price - ${itemList[index]['price']}/-",
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .grey,
//                                                                         fontSize:
//                                                                             12),
//                                                                   )),
//                                                               Column(
//                                                                 children: [
//                                                                   Container(
//                                                                       padding: EdgeInsets
//                                                                           .only(
//                                                                               right:
//                                                                                   0,
//                                                                               top:
//                                                                                   10),
//                                                                       margin: EdgeInsets
//                                                                           .only(
//                                                                               left:
//                                                                                   15),
//                                                                       child: Row(
//                                                                         children: <
//                                                                             Widget>[
//                                                                           Text(
//                                                                             "${itemList[index]['size']}",
//                                                                             maxLines:
//                                                                                 1,
//                                                                             overflow:
//                                                                                 TextOverflow.ellipsis,
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Text(
//                                                                             " | ",
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.blue,
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                                Text(
//                                                                             "${itemList[index]['size']}",
//                                                                             maxLines:
//                                                                                 1,
//                                                                             overflow:
//                                                                                 TextOverflow.ellipsis,
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Text(
//                                                                             " | ",
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.blue,
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Text(
//                                                                             "${itemList[index]['front_camera']}",
//                                                                             maxLines:
//                                                                                 1,
//                                                                             overflow:
//                                                                                 TextOverflow.ellipsis,
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Text(
//                                                                             " | ",
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.blue,
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Text(
//                                                                             "${itemList[index]['rear_camera']}",
//                                                                             maxLines:
//                                                                                 1,
//                                                                             overflow:
//                                                                                 TextOverflow.ellipsis,
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Center(
//                                                                             child:
//                                                                                 Text(
//                                                                               " | ",
//                                                                               style: TextStyle(
//                                                                                   color: Colors.blue,
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                           ),
//                                                                           Expanded(
//                                                                             child:
//                                                                                 Text(
//                                                                               "${itemList[index]['processor']}",
//                                                                               maxLines:
//                                                                                   1,
//                                                                               overflow:
//                                                                                   TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                   color: Colors.grey.withOpacity(0.7),
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                           ),
//                                                                           Text(
//                                                                             " | ",
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.blue,
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Text(
//                                                                             "${itemList[index]['rom']}",
//                                                                             maxLines:
//                                                                                 1,
//                                                                             overflow:
//                                                                                 TextOverflow.ellipsis,
//                                                                             style: TextStyle(
//                                                                                 color:
//                                                                                     Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12),
//                                                                           ),
//                                                                           Center(
//                                                                             child:
//                                                                                 Text(
//                                                                               " | ",
//                                                                               style: TextStyle(
//                                                                                   color: Colors.blue,
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                           ),
//                                                                           Expanded(
//                                                                             child:
//                                                                                 Text(
//                                                                               "${itemList[index]['battery']}",
//                                                                               maxLines:
//                                                                                   1,
//                                                                               overflow:
//                                                                                   TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                   color: Colors.grey.withOpacity(0.7),
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                           ),
//                                                                         ],
//                                                                       )),
//                                                                 ],
//                                                               ),
//                                                               Container(
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           top:
//                                                                               5,
//                                                                           left:
//                                                                               8),
//                                                                   child: Container(
//                                                                       margin: EdgeInsets.only(left: 5),
//                                                                       child: RatingBar.builder(
//                                                                         initialRating:
//                                                                             3,
//                                                                         minRating:
//                                                                             1,
//                                                                         direction:
//                                                                             Axis.horizontal,
//                                                                         allowHalfRating:
//                                                                             true,
//                                                                         itemCount:
//                                                                             5,
//                                                                         itemPadding:
//                                                                             EdgeInsets.symmetric(horizontal: 4.0),
//                                                                         itemBuilder:
//                                                                             (context, _) =>
//                                                                                 Icon(
//                                                                           Icons
//                                                                               .star,
//                                                                           color:
//                                                                               Colors.amber,
//                                                                         ),
//                                                                         onRatingUpdate:
//                                                                             (rating) {
//                                                                           print(
//                                                                               rating);
//                                                                         },
//                                                                       ))),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ))
//                                           : itemList[index]['status'] ==
//                                                   selectedFilter
//                                               ? GestureDetector(
//                                                   onTap: () {
//                                                     setState(() {
//                                                       address = itemList[index]
//                                                               ['name'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['price'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['color'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['size'] +
//                                                           ", " +
                                                     
//                                                         itemList[index]
//                                                             ['front_camera'] +
//                                                         ", " +
//                                                         itemList[index]['rear_camera'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['processor'] +
//                                                         ", " +
//                                                         itemList[index]
//                                                             ['rom'] +
//                                                           itemList[index]
//                                                               ['ram'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['battery'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['status'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['condition'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['posted'] +
//                                                           ", " +
//                                                           itemList[index]
//                                                               ['warranty'];
//                                                     });
//                                                     //  Navigator.pop(context);
//                                                   },
//                                                   child: Container(
//                                                     margin: EdgeInsets.only(
//                                                         left: 15,
//                                                         right: 15,
//                                                         top: 5,
//                                                         bottom: 5),
//                                                     padding: EdgeInsets.all(10),
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         border: Border.all(
//                                                             color: Colors.grey
//                                                                 .withOpacity(
//                                                                     0.1)),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: Row(
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .start,
//                                                       children: <Widget>[
//                                                         Image.asset(
//                                                           "${itemList[index]['pic']}",
//                                                           height: 100,
//                                                           width: 80,
//                                                         ),
//                                                         Expanded(
//                                                           child: Container(
//                                                             //margin: EdgeInsets.only(left: 15),
//                                                             child: Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               children: <
//                                                                   Widget>[
//                                                                 Row(
//                                                                   children: <
//                                                                       Widget>[
//                                                                     Expanded(
//                                                                       child:
//                                                                           Container(
//                                                                         padding:
//                                                                             EdgeInsets.only(right: 0),
//                                                                         margin: EdgeInsets.only(
//                                                                             left:
//                                                                                 15),
//                                                                         child:
//                                                                             Text(
//                                                                           "${itemList[index]['name']}",
//                                                                           maxLines:
//                                                                               2,
//                                                                           overflow:
//                                                                               TextOverflow.ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey,
//                                                                               fontSize: 15,
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     Container(
//                                                                         padding:
//                                                                             EdgeInsets.all(
//                                                                                 5),
//                                                                         decoration: BoxDecoration(
//                                                                             color: itemList[index]['status'] == 'Used'
//                                                                                 ? Colors
//                                                                                     .grey
//                                                                                 : Colors
//                                                                                     .blue,
//                                                                             borderRadius: BorderRadiusDirectional.circular(
//                                                                                 5)),
//                                                                         child: Text(
//                                                                             "${itemList[index]['status']}",
//                                                                             style:
//                                                                                 TextStyle(color: Colors.white, fontSize: 10)))
//                                                                   ],
//                                                                 ),
//                                                                 Container(
//                                                                     padding: EdgeInsets.only(
//                                                                         right:
//                                                                             0,
//                                                                         top:
//                                                                             10),
//                                                                     margin: EdgeInsets
//                                                                         .only(
//                                                                             left:
//                                                                                 15),
//                                                                     child: Text(
//                                                                       "Price - ${itemList[index]['price']}/-",
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .grey,
//                                                                           fontSize:
//                                                                               12),
//                                                                     )),
//                                                                 Column(
//                                                                   children: [
//                                                                     Container(
//                                                                         padding: EdgeInsets.only(
//                                                                             right:
//                                                                                 0,
//                                                                             top:
//                                                                                 10),
//                                                                         margin: EdgeInsets
//                                                                             .only(
//                                                                                 left:
//                                                                                     15),
//                                                                         child: Row(
//                                                                           children: <
//                                                                               Widget>[
//                                                                             Text(
//                                                                               "${itemList[index]['size']}",
//                                                                               maxLines:
//                                                                                   1,
//                                                                               overflow:
//                                                                                   TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                   color: Colors.grey.withOpacity(0.7),
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                             Text(
//                                                                               " | ",
//                                                                               style: TextStyle(
//                                                                                   color: Colors.blue,
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                             Text(
//                                                                               "${itemList[index]['camera']}",
//                                                                               maxLines:
//                                                                                   1,
//                                                                               overflow:
//                                                                                   TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                   color: Colors.grey.withOpacity(0.7),
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                             Text(
//                                                                               " | ",
//                                                                               style: TextStyle(
//                                                                                   color: Colors.blue,
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                             Text(
//                                                                               "${itemList[index]['ram']}",
//                                                                               maxLines:
//                                                                                   1,
//                                                                               overflow:
//                                                                                   TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                   color: Colors.grey.withOpacity(0.7),
//                                                                                   fontSize: 12),
//                                                                             ),
//                                                                             Center(
//                                                                               child:
//                                                                                   Text(
//                                                                                 " | ",
//                                                                                 style:
//                                                                                     TextStyle(color: Colors.blue, fontSize: 12),
//                                                                               ),
//                                                                             ),
//                                                                             Expanded(
//                                                                               child:
//                                                                                   Text(
//                                                                                 "${itemList[index]['battery']}",
//                                                                                 maxLines:
//                                                                                     1,
//                                                                                 overflow:
//                                                                                     TextOverflow.ellipsis,
//                                                                                 style:
//                                                                                     TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 12),
//                                                                               ),
//                                                                             ),
//                                                                           ],
//                                                                         )),
//                                                                   ],
//                                                                 ),
//                                                                 Container(
//                                                                     margin: EdgeInsets.only(
//                                                                         top: 5,
//                                                                         left:
//                                                                             8),
//                                                                     child: Container(
//                                                                         margin: EdgeInsets.only(left: 5),
//                                                                         child: RatingBar.builder(
//                                                                           initialRating:
//                                                                               3,
//                                                                           minRating:
//                                                                               1,
//                                                                           direction:
//                                                                               Axis.horizontal,
//                                                                           allowHalfRating:
//                                                                               true,
//                                                                           itemCount:
//                                                                               5,
//                                                                           itemPadding:
//                                                                               EdgeInsets.symmetric(horizontal: 4.0),
//                                                                           itemBuilder: (context, _) =>
//                                                                               Icon(
//                                                                             Icons.star,
//                                                                             color:
//                                                                                 Colors.amber,
//                                                                           ),
//                                                                           onRatingUpdate:
//                                                                               (rating) {
//                                                                             print(rating);
//                                                                           },
//                                                                         ))),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                               : Container();
//                                 })))
//                               ],
//                             ),
//                           ),

//                           //Laptop section//
//                           SingleChildScrollView(
//                             physics: BouncingScrollPhysics(),
//                             child: Column(
//                               //for filter & list
//                               children: <Widget>[
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   Addlaptop()));
//                                     });
//                                   },
//                                   child: Container(
//                                     height: 50,
//                                     width: MediaQuery.of(context).size.width,
//                                     color: Colors.blue,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         Container(
//                                             child: Icon(
//                                           Icons.add,
//                                           color: Colors.white,
//                                         )),
//                                         Container(
//                                           child: Text(
//                                             "Add product",
//                                             style: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 20),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 // filter with click option
//                                 GestureDetector(
//                                   onTap: () {
//                                     setState(() {
//                                       if (isFilter1 == true) {
//                                         isFilter1 = false;
//                                       } else {
//                                         isFilter1 = true;
//                                       }
//                                     });
//                                   },
//                                   child: Container(
//                                     width: MediaQuery.of(context).size.width,
//                                     margin: EdgeInsets.only(
//                                         top: 10, left: 15, right: 15),
//                                     padding: EdgeInsets.all(5),
//                                     decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(5),
//                                         border: Border.all(
//                                             width: 0.5,
//                                             color:
//                                                 Colors.grey.withOpacity(0.3))),
//                                     child: Column(
//                                       children: <Widget>[
//                                         Container(
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: <Widget>[
//                                               Text(
//                                                 selectedFilter1, //selected filter option
//                                                 style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.normal),
//                                               ),
//                                               Icon(Icons.arrow_drop_down)
//                                             ],
//                                           ),
//                                         ),
//                                         isFilter1 == false
//                                             ? Container()
//                                             : Divider(),
//                                         isFilter1 == false
//                                             ? Container()
//                                             : Column(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: List.generate(
//                                                     filterList1.length,
//                                                     (index) {
//                                                   return GestureDetector(
//                                                     onTap: () {
//                                                       setState(() {
//                                                         selectedFilter1 =
//                                                             filterList1[index];
//                                                         isFilter1 = false;
//                                                       });
//                                                     },
//                                                     child: Container(
//                                                       padding: EdgeInsets.only(
//                                                           top: 5, bottom: 5),
//                                                       width:
//                                                           MediaQuery.of(context)
//                                                               .size
//                                                               .width,
//                                                       child: Text(
//                                                         filterList1[index],
//                                                         style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 15,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .normal),
//                                                       ),
//                                                     ),
//                                                   );
//                                                 }),
//                                               )
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                                 Container(
//                                     child: Column(
//                                   children: List.generate(laptopitemList.length,
//                                       (index) {
//                                     return selectedFilter1 == "All"
//                                         //first list for laptop
//                                         ? GestureDetector(
//                                             onTap: () {
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           LaptopdetailsPage(
//                                                               laptopitemList[
//                                                                   index],
//                                                               laptopitemList)));
//                                             },
//                                             child: Container(
//                                               margin: EdgeInsets.only(
//                                                   left: 15,
//                                                   right: 15,
//                                                   top: 5,
//                                                   bottom: 5),
//                                               padding: EdgeInsets.all(10),
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   border: Border.all(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.1)),
//                                                   borderRadius:
//                                                       BorderRadius.circular(5)),
//                                               child: Row(
//                                                 crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                 children: <Widget>[
//                                                   Image.asset(
//                                                     "${laptopitemList[index]['pic']}",
//                                                     height: 100,
//                                                     width: 80,
//                                                   ),
//                                                   Expanded(
//                                                     child: Container(
//                                                       //margin: EdgeInsets.only(left: 15),
//                                                       child: Column(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: <Widget>[
//                                                           Row(
//                                                             children: <Widget>[
//                                                               Expanded(
//                                                                 child:
//                                                                     Container(
//                                                                   padding: EdgeInsets
//                                                                       .only(
//                                                                           right:
//                                                                               0),
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               15),
//                                                                   child: Text(
//                                                                     "${laptopitemList[index]['name']}",
//                                                                     maxLines: 2,
//                                                                     overflow:
//                                                                         TextOverflow
//                                                                             .ellipsis,
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .grey,
//                                                                         fontSize:
//                                                                             15,
//                                                                         fontWeight:
//                                                                             FontWeight.bold),
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               Container(
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .all(
//                                                                               5),
//                                                                   decoration: BoxDecoration(
//                                                                       color: laptopitemList[index]['status'] ==
//                                                                               'Used'
//                                                                           ? Colors
//                                                                               .grey
//                                                                           : Colors
//                                                                               .blue,
//                                                                       borderRadius:
//                                                                           BorderRadiusDirectional.circular(
//                                                                               5)),
//                                                                   child: Text(
//                                                                       "${laptopitemList[index]['status']}",
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .white,
//                                                                           fontSize:
//                                                                               10)))
//                                                             ],
//                                                           ),
//                                                           Container(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       right: 0,
//                                                                       top: 10),
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       left: 15),
//                                                               child: Text(
//                                                                 "Price - ${laptopitemList[index]['price']}/-",
//                                                                 style: TextStyle(
//                                                                     color: Colors
//                                                                         .grey,
//                                                                     fontSize:
//                                                                         12),
//                                                               )),
//                                                           Container(
//                                                               padding: EdgeInsets
//                                                                   .only(
//                                                                       right: 0,
//                                                                       top: 10),
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       left: 15),
//                                                               child: Row(
//                                                                 children: <
//                                                                     Widget>[
//                                                                   Expanded(
//                                                                     child: Text(
//                                                                       "${laptopitemList[index]['display']}",
//                                                                       maxLines:
//                                                                           1,
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .ellipsis,
//                                                                       style: TextStyle(
//                                                                           color: Colors.grey.withOpacity(
//                                                                               0.7),
//                                                                           fontSize:
//                                                                               12),
//                                                                     ),
//                                                                   ),
//                                                                   Text(
//                                                                     " | ",
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .blue,
//                                                                         fontSize:
//                                                                             12),
//                                                                   ),
//                                                                   Expanded(
//                                                                     child: Text(
//                                                                       "${laptopitemList[index]['storage']}",
//                                                                       maxLines:
//                                                                           1,
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .ellipsis,
//                                                                       style: TextStyle(
//                                                                           color: Colors.grey.withOpacity(
//                                                                               0.7),
//                                                                           fontSize:
//                                                                               12),
//                                                                     ),
//                                                                   ),
//                                                                   Text(
//                                                                     " | ",
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .blue,
//                                                                         fontSize:
//                                                                             12),
//                                                                   ),
//                                                                   Expanded(
//                                                                     child: Text(
//                                                                       "${laptopitemList[index]['memory']}",
//                                                                       maxLines:
//                                                                           1,
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .ellipsis,
//                                                                       style: TextStyle(
//                                                                           color: Colors.grey.withOpacity(
//                                                                               0.7),
//                                                                           fontSize:
//                                                                               12),
//                                                                     ),
//                                                                   ),
//                                                                   Center(
//                                                                     child: Text(
//                                                                       " | ",
//                                                                       style: TextStyle(
//                                                                           color: Colors
//                                                                               .blue,
//                                                                           fontSize:
//                                                                               12),
//                                                                     ),
//                                                                   ),
//                                                                   Expanded(
//                                                                     child: Text(
//                                                                       "${laptopitemList[index]['graphics']}",
//                                                                       maxLines:
//                                                                           1,
//                                                                       overflow:
//                                                                           TextOverflow
//                                                                               .ellipsis,
//                                                                       style: TextStyle(
//                                                                           color: Colors.grey.withOpacity(
//                                                                               0.7),
//                                                                           fontSize:
//                                                                               12),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               )),
//                                                           Container(
//                                                             margin:
//                                                                 EdgeInsets.only(
//                                                                     top: 5,
//                                                                     left: 8),
//                                                             child: Container(
//                                                                 margin: EdgeInsets
//                                                                     .only(
//                                                                         left:
//                                                                             5),
//                                                                 child: RatingBar
//                                                                     .builder(
//                                                                   initialRating:
//                                                                       3,
//                                                                   minRating: 1,
//                                                                   direction: Axis
//                                                                       .horizontal,
//                                                                   allowHalfRating:
//                                                                       true,
//                                                                   itemCount: 5,
//                                                                   itemPadding: EdgeInsets
//                                                                       .symmetric(
//                                                                           horizontal:
//                                                                               4.0),
//                                                                   itemBuilder:
//                                                                       (context,
//                                                                               _) =>
//                                                                           Icon(
//                                                                     Icons.star,
//                                                                     color: Colors
//                                                                         .amber,
//                                                                   ),
//                                                                   onRatingUpdate:
//                                                                       (rating) {
//                                                                     print(
//                                                                         rating);
//                                                                   },
//                                                                 )),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ),
//                                           )
//                                         //2nd list for laptop
//                                         : laptopitemList[index]['status'] ==
//                                                 selectedFilter1
//                                             ? GestureDetector(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               LaptopdetailsPage(
//                                                                   laptopitemList[
//                                                                       index],
//                                                                   laptopitemList)));
//                                                 },
//                                                 child: Container(
//                                                   margin: EdgeInsets.only(
//                                                       left: 15,
//                                                       right: 15,
//                                                       top: 5,
//                                                       bottom: 5),
//                                                   padding: EdgeInsets.all(10),
//                                                   width: MediaQuery.of(context)
//                                                       .size
//                                                       .width,
//                                                   decoration: BoxDecoration(
//                                                       color: Colors.white,
//                                                       border: Border.all(
//                                                           color: Colors.grey
//                                                               .withOpacity(
//                                                                   0.1)),
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               5)),
//                                                   child: Row(
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .start,
//                                                     children: <Widget>[
//                                                       Image.asset(
//                                                         "${laptopitemList[index]['pic']}",
//                                                         height: 100,
//                                                       ),
//                                                       Expanded(
//                                                         child: Container(
//                                                           //margin: EdgeInsets.only(left: 15),
//                                                           child: Column(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: <Widget>[
//                                                               Row(
//                                                                 children: <
//                                                                     Widget>[
//                                                                   Expanded(
//                                                                     child:
//                                                                         Container(
//                                                                       padding: EdgeInsets.only(
//                                                                           right:
//                                                                               0),
//                                                                       margin: EdgeInsets.only(
//                                                                           left:
//                                                                               15),
//                                                                       child:
//                                                                           Text(
//                                                                         "${laptopitemList[index]['name']}",
//                                                                         maxLines:
//                                                                             2,
//                                                                         overflow:
//                                                                             TextOverflow.ellipsis,
//                                                                         style: TextStyle(
//                                                                             color: Colors
//                                                                                 .grey,
//                                                                             fontSize:
//                                                                                 15,
//                                                                             fontWeight:
//                                                                                 FontWeight.bold),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                   Container(
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               5),
//                                                                       decoration: BoxDecoration(
//                                                                           color: laptopitemList[index]['status'] == 'Used'
//                                                                               ? Colors
//                                                                                   .grey
//                                                                               : Colors
//                                                                                   .blue,
//                                                                           borderRadius: BorderRadiusDirectional.circular(
//                                                                               5)),
//                                                                       child: Text(
//                                                                           "${laptopitemList[index]['status']}",
//                                                                           style: TextStyle(
//                                                                               color: Colors.white,
//                                                                               fontSize: 10)))
//                                                                 ],
//                                                               ),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .only(
//                                                                           right:
//                                                                               0,
//                                                                           top:
//                                                                               10),
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               15),
//                                                                   child: Text(
//                                                                     "Price - ${laptopitemList[index]['price']}/-",
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .grey,
//                                                                         fontSize:
//                                                                             12),
//                                                                   )),
//                                                               Container(
//                                                                   padding: EdgeInsets
//                                                                       .only(
//                                                                           right:
//                                                                               0,
//                                                                           top:
//                                                                               10),
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               15),
//                                                                   child: Row(
//                                                                     children: <
//                                                                         Widget>[
//                                                                       Expanded(
//                                                                         child:
//                                                                             Text(
//                                                                           "${laptopitemList[index]['display']}",
//                                                                           maxLines:
//                                                                               1,
//                                                                           overflow:
//                                                                               TextOverflow.ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey.withOpacity(0.7),
//                                                                               fontSize: 12),
//                                                                         ),
//                                                                       ),
//                                                                       Text(
//                                                                         " | ",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.blue,
//                                                                             fontSize: 12),
//                                                                       ),
//                                                                       Expanded(
//                                                                         child:
//                                                                             Text(
//                                                                           "${laptopitemList[index]['storage']}",
//                                                                           maxLines:
//                                                                               1,
//                                                                           overflow:
//                                                                               TextOverflow.ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey.withOpacity(0.7),
//                                                                               fontSize: 12),
//                                                                         ),
//                                                                       ),
//                                                                       Text(
//                                                                         " | ",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.blue,
//                                                                             fontSize: 12),
//                                                                       ),
//                                                                       Expanded(
//                                                                         child:
//                                                                             Text(
//                                                                           "${laptopitemList[index]['memory']}",
//                                                                           maxLines:
//                                                                               1,
//                                                                           overflow:
//                                                                               TextOverflow.ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey.withOpacity(0.7),
//                                                                               fontSize: 12),
//                                                                         ),
//                                                                       ),
//                                                                       Center(
//                                                                         child:
//                                                                             Text(
//                                                                           " | ",
//                                                                           style: TextStyle(
//                                                                               color: Colors.blue,
//                                                                               fontSize: 12),
//                                                                         ),
//                                                                       ),
//                                                                       Expanded(
//                                                                         child:
//                                                                             Text(
//                                                                           "${laptopitemList[index]['graphics']}",
//                                                                           maxLines:
//                                                                               1,
//                                                                           overflow:
//                                                                               TextOverflow.ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey.withOpacity(0.7),
//                                                                               fontSize: 12),
//                                                                         ),
//                                                                       ),
//                                                                     ],
//                                                                   )),
//                                                               Container(
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           top:
//                                                                               5,
//                                                                           left:
//                                                                               8),
//                                                                   child: Container(
//                                                                       margin: EdgeInsets.only(left: 5),
//                                                                       child: Container(
//                                                                         margin: EdgeInsets.only(
//                                                                             top:
//                                                                                 5,
//                                                                             left:
//                                                                                 8),
//                                                                         child: Container(
//                                                                             margin: EdgeInsets.only(left: 5),
//                                                                             child: RatingBar.builder(
//                                                                               initialRating: 3,
//                                                                               minRating: 1,
//                                                                               direction: Axis.horizontal,
//                                                                               allowHalfRating: true,
//                                                                               itemCount: 5,
//                                                                               itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
//                                                                               itemBuilder: (context, _) => Icon(
//                                                                                 Icons.star,
//                                                                                 color: Colors.amber,
//                                                                               ),
//                                                                               onRatingUpdate: (rating) {
//                                                                                 print(rating);
//                                                                               },
//                                                                             )),
//                                                                       )))
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               )
//                                             : Container();
//                                   }),
//                                 )),
//                               ],
//                             ),
//                           ),
//                           //watch section//

//                           Container(
//                             child: SingleChildScrollView(
//                               physics: BouncingScrollPhysics(),
//                               child: Column(
//                                   // for laptop filter & list
//                                   children: <Widget>[
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       Addwatch()));
//                                         });
//                                       },
//                                       child: Container(
//                                         height: 50,
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         color: Colors.blue,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             Container(
//                                                 child: Icon(
//                                               Icons.add,
//                                               color: Colors.white,
//                                             )),
//                                             Container(
//                                               child: Text(
//                                                 "Add product",
//                                                 style: TextStyle(
//                                                     color: Colors.white,
//                                                     fontSize: 20),
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {
//                                         setState(() {
//                                           if (isFilter2 == true) {
//                                             isFilter2 = false;
//                                           } else {
//                                             isFilter2 = true;
//                                           }
//                                         });
//                                       },
//                                       child: Container(
//                                         width:
//                                             MediaQuery.of(context).size.width,
//                                         margin: EdgeInsets.only(
//                                             top: 10, left: 15, right: 15),
//                                         padding: EdgeInsets.all(5),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5),
//                                             border: Border.all(
//                                                 width: 0.5,
//                                                 color: Colors.grey
//                                                     .withOpacity(0.3))),
//                                         child: Column(children: <Widget>[
//                                           Container(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: <Widget>[
//                                                 Text(
//                                                   selectedFilter2,
//                                                   style: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 15,
//                                                     fontWeight:
//                                                         FontWeight.normal,
//                                                   ),
//                                                 ),
//                                                 Icon(Icons.arrow_drop_down)
//                                               ],
//                                             ),
//                                           ),
//                                           isFilter2 == false
//                                               ? Container()
//                                               : Divider(),
//                                           isFilter2 == false
//                                               ? Container()
//                                               : Column(
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: List.generate(
//                                                       filterList2.length,
//                                                       (index) {
//                                                     return GestureDetector(
//                                                       onTap: () {
//                                                         setState(() {
//                                                           selectedFilter2 =
//                                                               filterList2[
//                                                                   index];
//                                                           isFilter2 = false;
//                                                         });
//                                                       },
//                                                       child: Container(
//                                                         padding:
//                                                             EdgeInsets.only(
//                                                                 top: 5,
//                                                                 bottom: 5),
//                                                         width: MediaQuery.of(
//                                                                 context)
//                                                             .size
//                                                             .width,
//                                                         child: Text(
//                                                           filterList2[index],
//                                                           style: TextStyle(
//                                                             color: Colors.grey,
//                                                             fontSize: 15,
//                                                             fontWeight:
//                                                                 FontWeight
//                                                                     .normal,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     );
//                                                   }))
//                                         ]),
//                                       ),
//                                     ),
//                                     Container(
//                                         child: Column(
//                                       children: List.generate(
//                                           wristwatchList.length, (index) {
//                                         return selectedFilter2 == "All"
//                                             ? GestureDetector(
//                                                 onTap: () {
//                                                   Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                           builder: (context) =>
//                                                               WristwatchdetailsPage(
//                                                                   wristwatchList[
//                                                                       index],
//                                                                   wristwatchList)));
//                                                 },
//                                                 child: Container(
//                                                     margin: EdgeInsets.only(
//                                                         left: 15,
//                                                         right: 15,
//                                                         top: 5,
//                                                         bottom: 5),
//                                                     padding: EdgeInsets.all(10),
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.white,
//                                                         border: Border.all(
//                                                             color: Colors.grey
//                                                                 .withOpacity(
//                                                                     0.1)),
//                                                         borderRadius:
//                                                             BorderRadius
//                                                                 .circular(5)),
//                                                     child: Row(
//                                                         crossAxisAlignment:
//                                                             CrossAxisAlignment
//                                                                 .start,
//                                                         children: <Widget>[
//                                                           Image.asset(
//                                                             "${wristwatchList[index]['pic']}",
//                                                             height: 100,
//                                                             width: 80,
//                                                           ),
//                                                           Expanded(
//                                                               child: Container(
//                                                                   //margin: EdgeInsets.only(left: 15),
//                                                                   child: Column(
//                                                                       crossAxisAlignment:
//                                                                           CrossAxisAlignment
//                                                                               .start,
//                                                                       children: <
//                                                                           Widget>[
//                                                                 Row(
//                                                                   children: <
//                                                                       Widget>[
//                                                                     Expanded(
//                                                                       child:
//                                                                           Container(
//                                                                         padding:
//                                                                             EdgeInsets.only(right: 0),
//                                                                         margin: EdgeInsets.only(
//                                                                             left:
//                                                                                 15),
//                                                                         child:
//                                                                             Text(
//                                                                           "${wristwatchList[index]['name']}",
//                                                                           maxLines:
//                                                                               2,
//                                                                           overflow:
//                                                                               TextOverflow.ellipsis,
//                                                                           style: TextStyle(
//                                                                               color: Colors.grey,
//                                                                               fontSize: 15,
//                                                                               fontWeight: FontWeight.bold),
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                     Container(
//                                                                       padding:
//                                                                           EdgeInsets.all(
//                                                                               5),
//                                                                       decoration: BoxDecoration(
//                                                                           color: wristwatchList[index]['status'] == 'New Arrival'
//                                                                               ? Colors.grey
//                                                                               : Colors.blue,
//                                                                           borderRadius: BorderRadiusDirectional.circular(5)),
//                                                                       child:
//                                                                           Text(
//                                                                         "${wristwatchList[index]['status']}",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.white,
//                                                                             fontSize: 10),
//                                                                       ),
//                                                                     ),
//                                                                   ],
//                                                                 ),
//                                                                 Container(
//                                                                   padding:
//                                                                       EdgeInsets
//                                                                           .only(
//                                                                     right: 0,
//                                                                     top: 10,
//                                                                   ),
//                                                                   margin: EdgeInsets
//                                                                       .only(
//                                                                           left:
//                                                                               15),
//                                                                   child: Text(
//                                                                     "price - ${wristwatchList[index]['price']}/-",
//                                                                     style: TextStyle(
//                                                                         color: Colors
//                                                                             .grey,
//                                                                         fontSize:
//                                                                             12),
//                                                                   ),
//                                                                 ),
//                                                                 Container(
//                                                                     padding:
//                                                                         EdgeInsets
//                                                                             .only(
//                                                                       right: 0,
//                                                                       top: 10,
//                                                                     ),
//                                                                     margin: EdgeInsets
//                                                                         .only(
//                                                                             left:
//                                                                                 15),
//                                                                     child: Row(
//                                                                         children: <
//                                                                             Widget>[
//                                                                           Expanded(
//                                                                             child:
//                                                                                 Text(
//                                                                               "${wristwatchList[index]['case_thickness']}",
//                                                                               maxLines: 1,
//                                                                               overflow: TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                 color: Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           Text(
//                                                                             "|",
//                                                                             style:
//                                                                                 TextStyle(
//                                                                               color: Colors.blue,
//                                                                               fontSize: 12,
//                                                                             ),
//                                                                           ),
//                                                                           Expanded(
//                                                                             child:
//                                                                                 Text(
//                                                                               "${wristwatchList[index]['water_resistant_depth']}",
//                                                                               maxLines: 1,
//                                                                               overflow: TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                 color: Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           Text(
//                                                                             "|",
//                                                                             style:
//                                                                                 TextStyle(color: Colors.blue, fontSize: 12),
//                                                                           ),
//                                                                           Expanded(
//                                                                             child:
//                                                                                 Text(
//                                                                               "${wristwatchList[index]['class_type']}",
//                                                                               maxLines: 1,
//                                                                               overflow: TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                 color: Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           Text(
//                                                                             "|",
//                                                                             style:
//                                                                                 TextStyle(color: Colors.blue, fontSize: 12),
//                                                                           ),
//                                                                           Expanded(
//                                                                             child:
//                                                                                 Text(
//                                                                               "${wristwatchList[index]['band_width']}",
//                                                                               maxLines: 1,
//                                                                               overflow: TextOverflow.ellipsis,
//                                                                               style: TextStyle(
//                                                                                 color: Colors.grey.withOpacity(0.7),
//                                                                                 fontSize: 12,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                         ])),
//                                                                 Container(
//                                                                   margin:
//                                                                       EdgeInsets
//                                                                           .only(
//                                                                     top: 5,
//                                                                     left: 8,
//                                                                   ),
//                                                                   child: Container(
//                                                                       margin: EdgeInsets.only(left: 5),
//                                                                       child: RatingBar.builder(
//                                                                         initialRating:
//                                                                             3,
//                                                                         minRating:
//                                                                             1,
//                                                                         direction:
//                                                                             Axis.horizontal,
//                                                                         allowHalfRating:
//                                                                             true,
//                                                                         itemCount:
//                                                                             5,
//                                                                         itemPadding:
//                                                                             EdgeInsets.symmetric(horizontal: 4.0),
//                                                                         itemBuilder:
//                                                                             (context, _) =>
//                                                                                 Icon(
//                                                                           Icons
//                                                                               .star,
//                                                                           color:
//                                                                               Colors.amber,
//                                                                         ),
//                                                                         onRatingUpdate:
//                                                                             (rating) {
//                                                                           print(
//                                                                               rating);
//                                                                         },
//                                                                       )),
//                                                                 )
//                                                               ])))
//                                                         ])),
//                                               )
//                                             : wristwatchList[index]['status'] ==
//                                                     selectedFilter2
//                                                 ? GestureDetector(
//                                                     onTap: () {
//                                                       Navigator.push(
//                                                           context,
//                                                           MaterialPageRoute(
//                                                               builder: (context) =>
//                                                                   WristwatchdetailsPage(
//                                                                       wristwatchList[
//                                                                           index],
//                                                                       wristwatchList)));
//                                                     },
//                                                     child: Container(
//                                                         margin: EdgeInsets.only(
//                                                             left: 15,
//                                                             right: 15,
//                                                             top: 5,
//                                                             bottom: 5),
//                                                         padding:
//                                                             EdgeInsets.all(10),
//                                                         width:
//                                                             MediaQuery.of(context)
//                                                                 .size
//                                                                 .width,
//                                                         decoration: BoxDecoration(
//                                                             color: Colors.white,
//                                                             border: Border.all(
//                                                                 color: Colors
//                                                                     .grey
//                                                                     .withOpacity(
//                                                                         0.1)),
//                                                             borderRadius:
//                                                                 BorderRadius
//                                                                     .circular(
//                                                                         5)),
//                                                         child: Row(
//                                                             crossAxisAlignment:
//                                                                 CrossAxisAlignment
//                                                                     .start,
//                                                             children: <Widget>[
//                                                               Image.asset(
//                                                                 "${wristwatchList[index]['pic']}",
//                                                                 height: 100,
//                                                               ),
//                                                               Expanded(
//                                                                   child:
//                                                                       Container(
//                                                                           //margin: EdgeInsets.only(left: 15),
//                                                                           child: Column(
//                                                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                                                               children: <Widget>[
//                                                                     Row(
//                                                                       children: <
//                                                                           Widget>[
//                                                                         Expanded(
//                                                                           child:
//                                                                               Container(
//                                                                             padding:
//                                                                                 EdgeInsets.only(right: 0),
//                                                                             margin:
//                                                                                 EdgeInsets.only(left: 15),
//                                                                             child:
//                                                                                 Text(
//                                                                               "${wristwatchList[index]['name']}",
//                                                                               maxLines: 2,
//                                                                               overflow: TextOverflow.ellipsis,
//                                                                               style: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                         Container(
//                                                                           padding:
//                                                                               EdgeInsets.all(5),
//                                                                           decoration: BoxDecoration(
//                                                                               color: wristwatchList[index]['status'] == 'New Arrival' ? Colors.grey : Colors.blue,
//                                                                               borderRadius: BorderRadiusDirectional.circular(5)),
//                                                                           child:
//                                                                               Text(
//                                                                             "${wristwatchList[index]['status']}",
//                                                                             style:
//                                                                                 TextStyle(color: Colors.white, fontSize: 10),
//                                                                           ),
//                                                                         ),
//                                                                       ],
//                                                                     ),
//                                                                     Container(
//                                                                       padding:
//                                                                           EdgeInsets
//                                                                               .only(
//                                                                         right:
//                                                                             0,
//                                                                         top: 10,
//                                                                       ),
//                                                                       margin: EdgeInsets.only(
//                                                                           left:
//                                                                               15),
//                                                                       child:
//                                                                           Text(
//                                                                         "price - ${wristwatchList[index]['price']}/-",
//                                                                         style: TextStyle(
//                                                                             color:
//                                                                                 Colors.grey,
//                                                                             fontSize: 12),
//                                                                       ),
//                                                                     ),
//                                                                     Container(
//                                                                         padding:
//                                                                             EdgeInsets
//                                                                                 .only(
//                                                                           right:
//                                                                               0,
//                                                                           top:
//                                                                               10,
//                                                                         ),
//                                                                         margin: EdgeInsets.only(
//                                                                             left:
//                                                                                 15),
//                                                                         child: Row(
//                                                                             children: <Widget>[
//                                                                               Expanded(
//                                                                                 child: Text(
//                                                                                   "${wristwatchList[index]['case_thickness']}",
//                                                                                   maxLines: 1,
//                                                                                   overflow: TextOverflow.ellipsis,
//                                                                                   style: TextStyle(
//                                                                                     color: Colors.grey.withOpacity(0.7),
//                                                                                     fontSize: 12,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               Text(
//                                                                                 "|",
//                                                                                 style: TextStyle(
//                                                                                   color: Colors.blue,
//                                                                                   fontSize: 12,
//                                                                                 ),
//                                                                               ),
//                                                                               Expanded(
//                                                                                 child: Text(
//                                                                                   "${wristwatchList[index]['water_resistant_depth']}",
//                                                                                   maxLines: 1,
//                                                                                   overflow: TextOverflow.ellipsis,
//                                                                                   style: TextStyle(
//                                                                                     color: Colors.grey.withOpacity(0.7),
//                                                                                     fontSize: 12,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               Text(
//                                                                                 "|",
//                                                                                 style: TextStyle(color: Colors.blue, fontSize: 12),
//                                                                               ),
//                                                                               Expanded(
//                                                                                 child: Text(
//                                                                                   "${wristwatchList[index]['class_type']}",
//                                                                                   maxLines: 1,
//                                                                                   overflow: TextOverflow.ellipsis,
//                                                                                   style: TextStyle(
//                                                                                     color: Colors.grey.withOpacity(0.7),
//                                                                                     fontSize: 12,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                               Text(
//                                                                                 "|",
//                                                                                 style: TextStyle(color: Colors.blue, fontSize: 12),
//                                                                               ),
//                                                                               Expanded(
//                                                                                 child: Text(
//                                                                                   "${wristwatchList[index]['band_width']}",
//                                                                                   maxLines: 1,
//                                                                                   overflow: TextOverflow.ellipsis,
//                                                                                   style: TextStyle(
//                                                                                     color: Colors.grey.withOpacity(0.7),
//                                                                                     fontSize: 12,
//                                                                                   ),
//                                                                                 ),
//                                                                               ),
//                                                                             ])),
//                                                                     Container(
//                                                                       margin: EdgeInsets
//                                                                           .only(
//                                                                         top: 5,
//                                                                         left: 8,
//                                                                       ),
//                                                                       child: Container(
//                                                                           margin: EdgeInsets.only(left: 5),
//                                                                           child: RatingBar.builder(
//                                                                             initialRating:
//                                                                                 3,
//                                                                             minRating:
//                                                                                 1,
//                                                                             direction:
//                                                                                 Axis.horizontal,
//                                                                             allowHalfRating:
//                                                                                 true,
//                                                                             itemCount:
//                                                                                 5,
//                                                                             itemPadding:
//                                                                                 EdgeInsets.symmetric(horizontal: 4.0),
//                                                                             itemBuilder: (context, _) =>
//                                                                                 Icon(
//                                                                               Icons.star,
//                                                                               color: Colors.amber,
//                                                                             ),
//                                                                             onRatingUpdate:
//                                                                                 (rating) {
//                                                                               print(rating);
//                                                                             },
//                                                                           )),
//                                                                     )
//                                                                   ])))
//                                                             ])),
//                                                   )
//                                                 : Container();
//                                       }),
//                                     ))
//                                   ]),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ]),
//                 ),
//               ))),
//     );
//   }
// }
//  var addressDetails;
//   int index = 0;
//   @override
//   void initState() {
//     super.initState();
//     fetchAddress();
//   }

//   fetchAddress() async {
//     final response = await http.get(ipAddress3);
//     setState(() {
//       addressDetails = json.decode(response.body);
//       // final response=
//       // await http.get('http://192.168.31.75/Funbox/addresslist.php');
//       // setState(() {
//       //   addressDetails= json.decode(response.body);
//     });
//     print("addressDetails");
//     for (int i = 0; i < addressDetails.length; i++) {
//       userAddressList.add({
//         'id': addressDetails[i]["id"],
//         'house': addressDetails[i]["house"],
//         'street': addressDetails[i]["street"],
//         'area': addressDetails[i]["area"],
//         'block': addressDetails[i]["block"],
//         'floor': addressDetails[i]["floor"],
//       });
//     }

//     lastId = addressDetails.length == 0
//         ? 0
//         : addressDetails[addressDetails.length - 1]["id"];
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.grey[200],
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           iconTheme: IconThemeData(color: Colors.blue),
//           title: Text(
//             "My Address",
//             style: TextStyle(
//                 color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w400),
//           ),
//           actions: [
//             IconButton(
//                 icon: Icon(
//                   Icons.add_circle_outline,
//                   color: Colors.blue,
//                 ),
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Editaddresspage()));
//                 }),
//           ],
//         ),
//         drawer: Drawer(
//           child: SafeArea(
//               child: SingleChildScrollView(
//             physics: BouncingScrollPhysics(),
//             child: Container(
//               margin: EdgeInsets.only(bottom: 20),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: double.infinity,
//                     padding: EdgeInsets.all(20),
//                     color: Colors.transparent,
//                     child: Center(
//                       child: Row(
//                         children: <Widget>[
//                           Container(
//                             width: 60,
//                             height: 60,
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(40.0),
//                               child: Image.asset("assets/profile.jpg"),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   child: Text(
//                                     "Hello,",
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 15),
//                                   ),
//                                 ),
//                                 Container(
//                                   child: Text(
//                                     "Nooraiya khan",
//                                     style: TextStyle(
//                                         fontSize: 18, color: Colors.black),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Divider(),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Mainpage()));
//                     },
//                     child: Container(
//                         margin: EdgeInsets.only(top: 15),
//                         padding: EdgeInsets.only(left: 15),
//                         // color: Colors.blue,
//                         child: Row(
//                           children: <Widget>[
//                             Icon(
//                               Icons.home,
//                               color: Colors.grey,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Container(
//                               child: Text(
//                                 "Home",
//                                 style:
//                                     TextStyle(color: Colors.grey, fontSize: 13),
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProfilePage()));
//                     },
//                     child: Container(
//                         padding: EdgeInsets.all(15),
//                         margin: EdgeInsets.only(right: 15),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(
//                               Icons.person,
//                               color: Colors.grey,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Profile",
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 13),
//                             )
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                       padding: EdgeInsets.only(left: 15, right: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Cartpage()));
//                             },
//                             child: Container(
//                               child: Row(
//                                 children: <Widget>[
//                                   Icon(
//                                     Icons.shopping_cart,
//                                     color: Colors.grey,
//                                     size: 16,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Cart",
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 13),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "4",
//                             style: TextStyle(color: Colors.blue, fontSize: 13),
//                           )
//                         ],
//                       )),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                       padding: EdgeInsets.only(left: 15, right: 15),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.pop(context);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Orderpage()));
//                             },
//                             child: Container(
//                               child: Row(
//                                 children: <Widget>[
//                                   Icon(
//                                     Icons.format_align_justify,
//                                     color: Colors.grey,
//                                     size: 16,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Orders",
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 13),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "4",
//                             style: TextStyle(color: Colors.blue, fontSize: 13),
//                           )
//                         ],
//                       )),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Addresspage()));
//                     },
//                     child: Container(
//                         decoration:
//                             BoxDecoration(color: Colors.grey.withOpacity(0.1)),
//                         padding: EdgeInsets.all(15),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(
//                               Icons.location_on,
//                               color: Colors.blue,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Address",
//                               style:
//                                   TextStyle(color: Colors.blue, fontSize: 13),
//                             )
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Voucherpage()));
//                     },
//                     child: Container(
//                         padding: EdgeInsets.only(left: 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: <Widget>[
//                                 Icon(
//                                   Icons.category,
//                                   color: Colors.grey,
//                                   size: 20,
//                                 ),
//                                 SizedBox(
//                                   width: 7,
//                                 ),
//                                 Text(
//                                   "Vouchers",
//                                   style: TextStyle(
//                                       color: Colors.grey, fontSize: 13),
//                                 )
//                               ],
//                             ),
//                             Container(
//                               padding: EdgeInsets.only(right: 15),
//                               child: Text(
//                                 "4",
//                                 style: TextStyle(color: Colors.blue),
//                               ),
//                             )
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => FavouritePage()));
//                     },
//                     child: Container(
//                         padding: EdgeInsets.only(left: 15, right: 15),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               child: Row(
//                                 children: <Widget>[
//                                   Icon(
//                                     Icons.favorite,
//                                     color: Colors.grey,
//                                     size: 18,
//                                   ),
//                                   SizedBox(
//                                     width: 10,
//                                   ),
//                                   Text(
//                                     "Favourite",
//                                     style: TextStyle(
//                                         color: Colors.grey, fontSize: 14),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Text(
//                               "2",
//                               style:
//                                   TextStyle(color: Colors.blue, fontSize: 14),
//                             )
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 40,
//                   ),
//                   Divider(
//                     height: 2,
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => Termspage()));
//                     },
//                     child: Container(
//                         padding: EdgeInsets.only(left: 15),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(
//                               Icons.security,
//                               color: Colors.grey,
//                               size: 20,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Terms and Conditions",
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 13),
//                             ),
//                           ],
//                         )),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   InkWell(
//                     onTap: () {
//                       showDialog(
//                           context: context,
//                           builder: (BuildContext context) => AlertDialog(
//                                   title: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     child: Text(
//                                       "Do you want to Log Out?",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 15),
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Container(
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {
//                                             Navigator.push(
//                                                 context,
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         Loginpage()));
//                                           },
//                                           child: Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 18,
//                                                 right: 18,
//                                                 top: 6,
//                                                 bottom: 6),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.blue,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             child: Text(
//                                               "Yes",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15),
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 15,
//                                         ),
//                                         GestureDetector(
//                                           onTap: () {
//                                             Navigator.pop(context);
//                                           },
//                                           child: Container(
//                                             padding: EdgeInsets.only(
//                                                 left: 18,
//                                                 right: 18,
//                                                 top: 6,
//                                                 bottom: 6),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.blue,
//                                                 borderRadius:
//                                                     BorderRadius.circular(5)),
//                                             child: Text(
//                                               "No",
//                                               style: TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 15),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               )));
//                     },
//                     child: Container(
//                         padding: EdgeInsets.only(left: 15),
//                         child: Row(
//                           children: <Widget>[
//                             Icon(
//                               Icons.power_settings_new,
//                               color: Colors.grey,
//                               size: 18,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Logout",
//                               style:
//                                   TextStyle(color: Colors.grey, fontSize: 14),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//           )),
//         ),
//         body: SafeArea(
//             child: userAddressList.length == 0
//                 ? Center(child: Text("No address found"))
//                 : SingleChildScrollView(
//                     physics: BouncingScrollPhysics(),
//                     child: Container(
//                         child: Column(
//                       children: List.generate(userAddressList.length, (index) {
//                         return GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               address = userAddressList[index]['house'] +
//                                   ", " +
//                                   userAddressList[index]['street'] +
//                                   ", " +
//                                   userAddressList[index]['area'] +
//                                   ", " +
//                                   userAddressList[index]['block'] +
//                                   ", " +
//                                   userAddressList[index]['floor'];
//                             });
//                             Navigator.pop(context);
//                           },
//                           child: Container(
//                               margin: EdgeInsets.only(
//                                 top: 10,
//                                 left: 10,
//                                 right: 10,
//                               ),
//                               padding: EdgeInsets.only(
//                                   top: 20, bottom: 5, left: 30, right: 10),
//                               // height:200,
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(5),
//                                   color: Colors.white),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                       child: Text(
//                                     "House/plot:${userAddressList[index]['house']}",
//                                     maxLines: 4,
//                                     // "Home",style: TextStyle(fontSize: 16,color: Colors.grey,fontWeight: FontWeight.w400),),
//                                   )),
//                                   Container(
//                                     child: Text(
//                                       "Street/road:${userAddressList[index]['street']}",
//                                       maxLines: 4,
//                                     ),
//                                   ),
//                                   Container(
//                                     child: Text(
//                                       "Area:${userAddressList[index]['area']}",
//                                       maxLines: 4,
//                                     ),
//                                   ),
//                                   Row(
//                                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         child: Text(
//                                           "Block/sector:${userAddressList[index]['block']}",
//                                           maxLines: 4,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                   Container(
//                                     child: Text(
//                                       "Floor/flat:${userAddressList[index]['floor']}",
//                                       maxLines: 2,
//                                     ),
//                                   ),
//                                   // SizedBox(
//                                   //   height: 30,
//                                   // ),
//                                   Row(

//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [

//                                       GestureDetector(
//                                         onTap: () {
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                   builder: (context) =>
//                                                       Editaddresspage()));
//                                         },
//                                         child: Container(
//                                           margin: EdgeInsets.only(bottom: 20),
//                                           child: Icon(
//                                             Icons.edit,
//                                             size: 25,
//                                             color: Colors.blue,

//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 20,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () {
//                                           setState(() {
//                                             userAddressList.removeAt(index);
//                                           });
//                                         },
//                                         child: Container(
//                                            margin: EdgeInsets.only(bottom: 20,right: 10),
//                                           child: Icon(
//                                             Icons.delete,
//                                             color: Colors.blue,
//                                             size: 25,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                         );
//                       }),
//                     )))));
//   }
// }
