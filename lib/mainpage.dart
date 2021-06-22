

import 'package:admin_ecommerce/main.dart';
import 'package:admin_ecommerce/orderlist.dart';
import 'package:admin_ecommerce/productlist.dart';

import 'package:admin_ecommerce/userlist.dart';

import 'package:flutter/material.dart';
import 'package:admin_ecommerce/productlist.dart';
class Mainpage extends StatefulWidget {
  @override
  _MainpageState createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
     // crossAxisAlignment: CrossAxisAlignment.center,
   mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        width: 220,
        height: 45,
        margin: EdgeInsets.only(left: 70),
        child: MaterialButton
        (
          
        onPressed: (){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Productlist()));
          });
        },
        child: Text("Product List",style: TextStyle(color: Colors.white,fontSize: 18),),
        color:Colors.blue ,
        splashColor: Colors.white,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      SizedBox(height: 20,),
        Container(
        width: 220,
        height: 45,
        margin: EdgeInsets.only(left: 70),
        child: MaterialButton
        (
          
          onPressed: (){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Orderlist()));
          });
        },
        child: Text("Order List",style: TextStyle(color: Colors.white,fontSize: 18),),
        color:Colors.blue ,
        splashColor: Colors.white,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
        SizedBox(height: 20,),
        Container(
        width: 220,
        height: 45,
        margin: EdgeInsets.only(left: 70),
        child: MaterialButton
        (
          
          onPressed: (){
          setState(() {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Userlist()));
          });
        },
        child: Text("User List",style: TextStyle(color: Colors.white,fontSize: 18),),
        color:Colors.blue ,
        splashColor: Colors.white,
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      ],
    ),
    );
  }
}