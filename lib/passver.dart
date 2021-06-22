import 'dart:ui';
import 'package:admin_ecommerce/forgotpass.dart';
import 'package:admin_ecommerce/password.dart';
import 'package:flutter/material.dart';

class Passver extends StatefulWidget {
  @override
  _PassverState createState() => _PassverState();
}

class _PassverState extends State<Passver> {
  bool isCodeBlank=false;
  var child;
  TextEditingController codecontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child:Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)=>Forgotpass()),
                  );
                },
                child: Container(
                  child: Icon(Icons.arrow_back,color: Colors.black54,
                  
                  ),
                  padding: EdgeInsets.only(left: 10,top: 20),
                ),
              ),
              Container(
                
             
             child: Image.asset("assets/send.jpg"),
              ),
             
              Container(
                                margin: EdgeInsets.fromLTRB(20, 10,20,0),
                padding: EdgeInsets.fromLTRB(10, 0,0,0),
                decoration: BoxDecoration(
                  border: Border.all(width: 0.1),
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.grey[100],
                ),
                child: TextField(
                  controller: codecontroller,
                 
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Your Verification Code... ",
                  
                  hintStyle:TextStyle(color: Colors.grey,fontSize: 15),
                  labelText: "Enter Your Verification Code",
                  labelStyle: TextStyle(color: Colors.blue)


                  ),
                ),

              ),
              isCodeBlank
              ?Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,color: Colors.redAccent,size: 17,),
                    SizedBox(width: 5,),
                    Text("Code Field Is Empty",style: TextStyle(color: Colors.redAccent),)
                  ],
                ),
              ):Container(),

              GestureDetector(
                onTap: (){
                  setState(() {
                    
                    if(codecontroller.text==""){
                      isCodeBlank=true;
                    }
                    else
                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>Password()
                    
                    ));
                  });
                },
                
                
                
               child: Container(
                                          margin:
                                              EdgeInsets.only(top:30, bottom: 20,left: 20,right: 20),
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
                                                    "Next",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                  
                                                ),
                                                SizedBox(width: 3,),
                                                Container(
                                                  child: Icon(Icons.arrow_forward,color: Colors.white,size: 16,),
                                                )    ], ),), ),)    ],
            
          ),
      ) 
      )
    ));
  }
}