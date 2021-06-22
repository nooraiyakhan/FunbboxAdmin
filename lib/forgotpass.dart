
import 'package:admin_ecommerce/login.dart';
import 'package:admin_ecommerce/passver.dart';
import 'package:flutter/material.dart';



class Forgotpass extends StatefulWidget {
  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  bool isEmailBlank=false;
  var child;
  TextEditingController emailcontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
             GestureDetector(
               onTap: (){
                 Navigator.pop(context);
                 Navigator.push(context, 
                 MaterialPageRoute(builder: (context)=>Loginpage())
                 );
               },
                child: Container(
                child: Icon(Icons.arrow_back,color: Colors.black54,),
                padding: EdgeInsets.only(right: 300,top: 20),
                ),
              ),
              Container(

                  child: Image.asset(
                "assets/forgotpass.jpg",
                height: 200,
              )),
              Container(
                margin: EdgeInsets.only(left: 20, top: 100),
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 10),
                child: Text(
                  "No worries! Enter your Email we will sent you a new reset ",
                  style: TextStyle(fontSize: 12),
                ),
              ),
          Container(
                //margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                margin: EdgeInsets.only(left: 20, top: 30, right: 20),
               padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  border: Border.all(width: 0.1),
                  borderRadius: BorderRadius.circular(7)
                  ),
                child: TextField(
                  controller:emailcontroller,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Type your Email...",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 15),
                      labelText: "Enter Email Or Phone Number",
                      labelStyle: TextStyle(color: Colors.blue)
                      
                      ),
                ),
              )   ,
              isEmailBlank
              ?Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline,color: Colors.redAccent,size: 17,),
                    SizedBox(width: 5,),
                    Text("Email/Number Field Is Empty",style: TextStyle(color: Colors.redAccent),)
                  ],
                ),
              )
              :Container(),
             
          
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          
                          if (emailcontroller.text==""){
                            isEmailBlank=true;

                          }
                        else{
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=>Passver())
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
                                                    "Send Verification Code",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                              
                                              ],
                                            ),
                                          ),
 
                ),
                    ),
         
            ],
          ),
        ),
      ),
    );
  }
}
