import 'package:admin_ecommerce/passver.dart';
import 'package:flutter/material.dart';


import 'login.dart';
class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isNewPasswordBlank=false;
  bool isConfirmPasswordBlank = false;
  var child;
  TextEditingController newpasswordcontroller = new TextEditingController();
  TextEditingController confirmpasswordcontroller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      backgroundColor: Colors.white,
      
      body:SafeArea(
        
        child:SingleChildScrollView(
          physics:BouncingScrollPhysics() ,
  
      child: Container(
        child:   Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children:
         <Widget>[
        GestureDetector(
          onTap: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>Passver())
            
            );
          },
          child: Container(
              child: Icon(Icons.arrow_back,color: Colors.black54,),
                  padding: EdgeInsets.only(left: 10,top: 20),
          ),
        ),
          Container(
            child:Container(
                 height: 230,
                 child: Image.asset("assets/strong.jpg"),
                 
            ) ,
        
          ),
        
          Container(
            padding: EdgeInsets.fromLTRB(10,0,0,0),
            margin: EdgeInsets.fromLTRB(20,0,20,0),
            decoration: BoxDecoration(
              border: Border.all(width: 0.1),
              borderRadius:BorderRadius.circular(7),
              color: Colors.grey[100]
              ),
              child: TextField(
               controller: newpasswordcontroller, 
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Your New Password...",
                  hintStyle:TextStyle(color: Colors.grey,fontSize: 15),
                  labelText:"Enter New Password" ,
                  labelStyle: TextStyle(color: Colors.blue)
                ),
              ),
          ),
          isNewPasswordBlank
          ?Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,color: Colors.redAccent,size: 17,),
                SizedBox(width: 5,),
                Text("New Password Field Is Empty")
              ],
            ),

          )
          :Container(),
          SizedBox(height: 20,),
              Container(
            padding: EdgeInsets.fromLTRB(10,0,0,0),
            margin: EdgeInsets.fromLTRB(20,0,20,0),
            decoration: BoxDecoration(
              border: Border.all(width: 0.1),
              borderRadius:BorderRadius.circular(7),
              color: Colors.grey[100]
              ),
              child: TextField(
               controller: confirmpasswordcontroller, 
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Type Your New Password...",
                  hintStyle:TextStyle(color: Colors.grey,fontSize: 15),
                  labelText:"Confirm Password" ,
                  labelStyle: TextStyle(color: Colors.blue)
                ),
              ),
          ),
          isConfirmPasswordBlank
          ?Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline,color: Colors.redAccent,size: 17,),
                SizedBox(width: 5,),
                Text("New Password Field Is Empty")
              ],
            ),

          )
          :Container(),
         
         GestureDetector(
           onTap: (){
             setState(() {
               
               if (newpasswordcontroller.text.isEmpty){
                 isNewPasswordBlank=true;
               }
               else if
               (confirmpasswordcontroller.text.isEmpty)
               {
                 isConfirmPasswordBlank=true;
               }
               else{
                 Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>Loginpage())
                 );
               }
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
                                                      "Submit",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16),
                                                    ),
                                                    
                                                  ),
                                                  SizedBox(width: 3,),
                                                     ], ),), ),
          ),
        ],
      )
     

  
    
      
     ) )) );
  }
}