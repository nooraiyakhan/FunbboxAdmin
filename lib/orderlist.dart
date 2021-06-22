import 'dart:convert';

import 'package:admin_ecommerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:http/http.dart' as http;

class Orderlist extends StatefulWidget {
  @override
  _OrderlistState createState() => _OrderlistState();
}

class _OrderlistState extends State<Orderlist> {
  // List orderList = [];
  // var orderDetails;
  // //final orderDetails;
  // int index = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   fetchOrder();
  // }

  // fetchOrder() async {
  //   final response = await http.get(ipAddress6);
  //   setState(() {
  //     orderDetails = json.decode(response.body);
  //   });
  //   print(orderDetails);
  //   for (int i = 0; i < orderDetails.length; i++) {
  //     double rat = double.parse(orderDetails[i]["rating"]);
  //     orderList.add({
  //       'id': orderDetails[i]["id"],
  //       'pic': orderDetails[i]["pic"],
  //       'name': orderDetails[i]["name"],
  //       'price': orderDetails[i]["price"],
  //       'size': orderDetails[i]["size"],
  //       'camera': orderDetails[i]["camera"],
  //       'ram': orderDetails[i]["ram"],
  //       'battery': orderDetails[i]["battery"],
  //       'rating': rat,
  //       'status': orderDetails[i]["status"],
  //       'order_by': orderDetails[i]["order_by"],
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        // appBar: AppBar(
        //   iconTheme: IconThemeData(color: Colors.blue),
        //   backgroundColor: Colors.white,
        //   title: Text(
        //     "Orders",
        //     style: TextStyle(
        //         color: Colors.grey,
        //         fontSize: 16,
        //         fontWeight: FontWeight.normal),
        //   ),
        // ),
        // body: SafeArea(
        //     child: SingleChildScrollView(
        //         physics: BouncingScrollPhysics(),
        //         child: Column(
        //             children: List.generate(orderList.length, (index) {
        //           return Container(
        //             margin:
        //                 EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        //             padding: EdgeInsets.all(10),
        //             width: MediaQuery.of(context).size.width,
        //             decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 border: Border.all(color: Colors.grey.withOpacity(0.1)),
        //                 borderRadius: BorderRadius.circular(5)),
        //             child: Row(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: <Widget>[
        //                 //  Image.asset(
        //                 //    "${orderList[index]['pic'] }",

        //                 //    // "${itemList[index]['pic']}",
        //                 //    height: 100,
        //                 //    width: 80,
        //                 //  ),
        //                 Expanded(
        //                   child: Container(
        //                     //margin: EdgeInsets.only(left: 15),
        //                     child: Column(
        //                       crossAxisAlignment: CrossAxisAlignment.start,
        //                       children: <Widget>[
        //                         Row(
        //                           children: <Widget>[
        //                             Expanded(
        //                               child: Container(
        //                                 padding: EdgeInsets.only(right: 0),
        //                                 margin: EdgeInsets.only(left: 15),
        //                                 child: Text(
        //                                   "${orderList[index]['name']}",
        //                                   maxLines: 1,
        //                                   overflow: TextOverflow.ellipsis,
        //                                   style: TextStyle(
        //                                       color: Colors.grey,
        //                                       fontSize: 15,
        //                                       fontWeight: FontWeight.bold),
        //                                 ),
        //                               ),
        //                             ),
        //                             Container(
        //                                 padding: EdgeInsets.all(5),
        //                                 decoration: BoxDecoration(
        //                                     color: orderList[index]['status'] ==
        //                                             'pending payment'
        //                                         ? Colors.grey
        //                                         : Colors.blue,
        //                                     borderRadius:
        //                                         BorderRadiusDirectional
        //                                             .circular(5)),
        //                                 child: Text(
        //                                     "${orderList[index]['status']}",
        //                                     style: TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 10))),
        //                           ],
        //                         ),
        //                         Container(
        //                             padding: EdgeInsets.only(right: 0, top: 10),
        //                             margin: EdgeInsets.only(left: 15),
        //                             child: Text(
        //                               "Price - ${orderList[index]['price']}/-",
        //                               style: TextStyle(
        //                                   color: Colors.grey, fontSize: 12),
        //                             )),
        //                         //  Container(
        //                         //      padding:
        //                         //          EdgeInsets.only(right: 0, top: 10),
        //                         //      margin: EdgeInsets.only(left: 15),
        //                         //      child: Row(
        //                         //        children: <Widget>[
        //                         //          Text(
        //                         //            "${orderList[index]['size']}",
        //                         //            maxLines: 1,
        //                         //            overflow: TextOverflow.ellipsis,
        //                         //            style: TextStyle(
        //                         //                color: Colors.grey
        //                         //                    .withOpacity(0.7),
        //                         //                fontSize: 12),
        //                         //          ),
        //                         //          Text(
        //                         //            " | ",
        //                         //            style: TextStyle(
        //                         //                color: Colors.blue,
        //                         //                fontSize: 12),
        //                         //          ),
        //                         //          Text(
        //                         //            "${orderList[index]['camera']}",
        //                         //            maxLines: 1,
        //                         //            overflow: TextOverflow.ellipsis,
        //                         //            style: TextStyle(
        //                         //                color: Colors.grey
        //                         //                    .withOpacity(0.7),
        //                         //                fontSize: 12),
        //                         //          ),
        //                         //          Text(
        //                         //            " | ",
        //                         //            style: TextStyle(
        //                         //                color: Colors.blue,
        //                         //                fontSize: 12),
        //                         //          ),
        //                         //          Text(
        //                         //            "${orderList[index]['ram']}",
        //                         //            maxLines: 1,
        //                         //            overflow: TextOverflow.ellipsis,
        //                         //            style: TextStyle(
        //                         //                color: Colors.grey
        //                         //                    .withOpacity(0.7),
        //                         //                fontSize: 12),
        //                         //          ),
        //                         //          Center(
        //                         //            child: Text(
        //                         //              " | ",
        //                         //              style: TextStyle(
        //                         //                  color: Colors.blue,
        //                         //                  fontSize: 12),
        //                         //            ),
        //                         //          ),
        //                         //          Expanded(
        //                         //            child: Text(
        //                         //              "${orderList[index]['battery']}",
        //                         //              maxLines: 1,
        //                         //              overflow: TextOverflow.ellipsis,
        //                         //              style: TextStyle(
        //                         //                  color: Colors.grey
        //                         //                      .withOpacity(0.7),
        //                         //                  fontSize: 12),
        //                         //            ),
        //                         //          ),
        //                         //        ],
        //                         //      )),
        //                         Container(
        //                             padding: EdgeInsets.only(right: 0, top: 10),
        //                             margin: EdgeInsets.only(left: 15),
        //                             child: Text(
        //                               "Order by - ${orderList[index]['order_by']}/-",
        //                               style: TextStyle(
        //                                   color: Colors.grey, fontSize: 12),
        //                             )),
        //                         SizedBox(
        //                           height: 10,
        //                         ),
        //                         Row(
        //                           mainAxisAlignment: MainAxisAlignment.center,
        //                           children: [
        //                             GestureDetector(onTap: (){
        //                               setState(() {
        //                                 orderList[index]['status']="Order Received";
        //                               });
        //                             },
        //                               child: Container(
        //                                 padding: EdgeInsets.only(
        //                                     left: 30,
        //                                     right: 30,
        //                                     top: 5,
        //                                     bottom: 5),
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(5),
        //                                     color: Colors.lightGreen),
        //                                 child: Text(
        //                                   "Accept",
        //                                   textAlign: TextAlign.center,
        //                                   style: TextStyle(
        //                                       color: Colors.white,
        //                                       fontSize: 18,
        //                                       fontWeight: FontWeight.w300),
        //                                 ),
        //                               ),
        //                             ),
        //                             SizedBox(
        //                               width: 15,
        //                             ),
        //                             GestureDetector(
        //                               onTap: (){
        //                                 setState(() {
        //                                   orderList.removeAt(index);
        //                                 });
        //                               },
        //                               child: Container(
        //                                 padding: EdgeInsets.only(
        //                                     left: 30,
        //                                     right: 30,
        //                                     top: 5,
        //                                     bottom: 5),
        //                                 decoration: BoxDecoration(
        //                                     borderRadius:
        //                                         BorderRadius.circular(5),
        //                                     color: Colors.red),
        //                                 child:
        //                                  GestureDetector(
        //                                    child: Text(
        //                                     "Decline",
        //                                     textAlign: TextAlign.center,
        //                                     style: TextStyle(
        //                                         color: Colors.white,
        //                                         fontSize: 18,
        //                                         fontWeight: FontWeight.w300),
        //                                 ),
        //                                  ),
        //                               ),
        //                             ),
        //                           ],
        //                         )
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           );
        //         })))));
     ); }
}
