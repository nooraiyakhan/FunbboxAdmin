import 'package:admin_ecommerce/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Color mainheader = Colors.blue;
Color subheader = Colors.lightBlue;
Color subwhite = Color(0xFFf4f4f4);
Color golden = Color(0xFFCFB53B);

String pageDirect = "";
int selectedPage = 0;

String address = "Choose address";
String name='';
String phone='';
String email='';

int lastId = 0;
int favLastId = 0;
int cartLastID=0;
int orderLastID=0;
int profileLastID=0;
List itemList=[];
List wristwatchList=[];
List laptopitemList=[];
List userProfileList=[];
List userOrderList=[];
List userCartList=[];
List userAddressList = [];
List userFavouriteList = [];
List userList = [];

String ipAddress = "http://192.168.0.105/Funbox/mobilelistdetails.php";
String ipAddress1 = "http://192.168.0.105/Funbox/laptopdetails.php";
String ipAddress2 = "http://192.168.0.105/Funbox/watchdetails.php";
String ipAddress6 = "http://192.168.0.105/Funbox/orderdetails.php";
String ipAddress7 = "http://192.168.0.105/Funbox/profilepage.php";
String mblEndPoint = "http://192.168.0.105/Funbox/mbldetails.php";
String lptpEndPoint = "http://192.168.0.105/Funbox/lptpdetails.php";
String watchEndPoint = "http://192.168.0.105/Funbox/watch.php";
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin E-commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: subheader,
      ),
      home: Loginpage(),
      //routes: routes,
    );
  }
}
