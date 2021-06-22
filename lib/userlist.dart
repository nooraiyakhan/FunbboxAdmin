import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'main.dart';

class Userlist extends StatefulWidget {
  @override
  _UserlistState createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  var profileDetails;
  int index = 0;
  void initState() {
    super.initState();
    fetchProfile();
  }

  fetchProfile() async {
    final response = await http.get(ipAddress7);
    setState(() {
      profileDetails = json.decode(response.body);
    });

    for (int i = 0; i <= profileDetails.length; i++) {
      userProfileList.add({
        'id': profileDetails[i]["id"],
        'name': profileDetails[i]["name"],
        'number': profileDetails[i]["number"],
        'email': profileDetails[i]["email"],
      });
    }
    print("profileDetails");
    lastId = profileDetails.length == 0
        ? 0
        : profileDetails[profileDetails.length - 1]["id"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.blue),
          backgroundColor: Colors.white,
          title: Text(
            "Profile",
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                    child: Column(
                        children:
                            List.generate(userProfileList.length, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Card(
                          elevation: 1,
                          child: Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        //              Container(
                                        //   width: 60,
                                        //   height: 60,
                                        //   margin: EdgeInsets.only(top: 20, left: 10, bottom: 20),
                                        //   child:
                                        //   //  ClipRRect(
                                        //   //     borderRadius: BorderRadius.circular(40),
                                        //   //     child: Image.asset("assets/profile.jpg")),
                                        // ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                child: Text(
                                              "${userProfileList[index]['name']}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )),
                                          ],
                                        )
                                      ]),
                                  //   Divider();

                                  Divider(),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Icon(
                                              Icons.phone,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Phone Number",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 2),
                                                child: Text(
                                                  "${userProfileList[index]['number']}",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                  ),
                                  Divider(),
                                  Padding(padding: EdgeInsets.only(top: 10)),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 10),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 10,
                                            ),
                                            child: Icon(
                                              Icons.email,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Email",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 2),
                                                child: Text(
                                                  "${userProfileList[index]['email']}",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 14),
                                                ),
                                              )
                                            ],
                                          )
                                        ]),
                                  )
                                ]),
                          ),
                        ),
                      );
                    })),
                  ),
                ],
              ),
            )));
  }
}
