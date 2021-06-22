import 'package:admin_ecommerce/forgotpass.dart';
import 'package:admin_ecommerce/mainpage.dart';
import 'package:admin_ecommerce/register.dart';
import 'package:flutter/material.dart';


class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  bool isSeen = false;
  bool isPhoneBlank = false;
  bool isPassBlank = false;

  bool isPhoneInvalid = false;
  String phone = "0", passwordMsg = "Password field is blank!";
  var child;
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 0, top: 100, bottom: 0),
              child: Text(
                "Welcome!",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              child: Text(
                "Hey there! Get the best from our app ",
                style: TextStyle(fontSize: 11, color: Colors.grey[500]),
              ),
              padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
            ),
            Padding(padding: EdgeInsets.all(20)),
            Column(children: <Widget>[
              Container(
                // height: 100,
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(10),
                  //  boxShadow: [
                  // BoxShadow(
                  // color:Color.fromRGBO(143, 148, 200, 3),
                  // blurRadius: 20.0,
                  // offset: Offset(0,0)
                  //  )
                  // ]
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      // padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: (Colors.grey)))),
                      child: TextField(
                        controller: phoneController,
                        onChanged: (value) {
                          setState(() {
                            phone = value;
                            if (phone.length > 11) {
                              phone = "";
                              phoneController.text = phone;
                            }
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone number",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    )
                  ],
                ),
              ),
              isPhoneBlank
                  ? Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.redAccent,
                            size: 17,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Phone number field is blank",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                child: Text(
                  "${phone.length}/11",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              isPhoneInvalid
                  ? Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.error_outline,
                            color: Colors.redAccent,
                            size: 17,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Phone number is invalid",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Column(children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 50)),
                Container(

                    // height: 100,
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(10),
                      //  boxShadow: [
                      // BoxShadow(
                      //color:Color.fromRGBO(143, 148, 200, 3),
                      // blurRadius: 20.0,
                      //offset: Offset(0,0)

                      //]
                    ),
                    child: Column(children: <Widget>[
                      Container(
                        // padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: (Colors.grey)))),
                        child: Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: passController,
                                obscureText: isSeen == false ? true : false,

                                ///password visible (false) or password not visible (true)
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (isSeen == false) {
                                      isSeen = true;
                                    } else {
                                      isSeen = false;
                                    }
                                  });
                                },
                                child: Icon(
                                  isSeen == false
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
                                  size: 22,
                                )),
                          ],
                        ),
                      ),
                    ])),
                isPassBlank
                    ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.error_outline,
                              color: Colors.redAccent,
                              size: 17,
                            ),
                            SizedBox(width: 5),
                            Text(
                              passwordMsg,
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          ],
                        ),
                      )
                    : Container(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Forgotpass()));
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(200, 10, 0, 0),
                    margin: EdgeInsets.only(top: 15),
                    child: Text("Forgot password?",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.normal)),
                  ),
                ),
                Container(
                  width: 220,
                  height: 45,
                  margin: EdgeInsets.only(top: 50),
                  child: MaterialButton(
                    splashColor: Colors.white,
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        if (phoneController.text.isEmpty) {
                          isPhoneBlank = true;
                        } else if (phone.length < 11) {
                          isPhoneBlank = false;
                          isPhoneInvalid = true;
                          //isEmailInvalid = false;
                        } else if (passController.text.isEmpty) {
                          isPassBlank = true;
                          isPhoneInvalid = false;
                        } else {
                           Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mainpage()));
                          // for (int i = 0; i < userList.length; i++) {
                          //   if (phoneController.text == userList[i]["phone"] &&
                          //       passController.text ==
                          //           userList[i]["password"]) {
                          //     isPassBlank = false;
                          //     isPhoneInvalid = false;
                          //     passwordMsg = "Password field is blank!";

                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => Mainpage()));
                          //   } else {
                          //     isPassBlank = true;
                          //     isPhoneInvalid = false;
                          //     passwordMsg = "User not found!";
                          //   }
                          // }
                        }

                        print("isEmailBlank");
                        print(isPhoneBlank);

                        print("isPassBlank");
                        print(isPassBlank);

                        print("isEmailInvalid");
                        print(isPhoneInvalid);
                      });
                    },
                    child: Text(
                      "Sign in",
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 10, 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),

                        SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerpage()));
                          },
                          child: Container(
                            child: Text("Sign up",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.normal)),
                          ),
                        ),

                        // Navigator.push(context,
                        // MaterialPageRoute(builder: (context) => registerpage()))
                      ]),
                )
              ])
            ])
          ]),
        )));
  }
}
