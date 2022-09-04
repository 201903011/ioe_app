import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ioe_app/screens/chalanscreen.dart';
import 'package:ioe_app/screens/homescreen.dart';
import 'package:ioe_app/screens/loginscreen.dart';
import 'package:ioe_app/screens/profile.dart';
import 'package:ioe_app/screens/vehiclescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'history.dart';

class MyDrawer extends StatefulWidget {
  final String url;
  final String name;
  final String email;

  const MyDrawer(
      {super.key, required this.url, required this.name, required this.email});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    final imageUrl = (widget.url == "" || widget.url == null)
        ? "https://avatars.githubusercontent.com/u/72931833?s=96&v=4"
        : widget.url;
    return Drawer(
      child: Container(
        color: Color.fromARGB(202, 0, 0, 0),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.black),
                margin: EdgeInsets.zero,
                accountName: Text(widget.name),
                accountEmail: Text(widget.email),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.white,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VehicleScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.car_fill,
                  color: Colors.white,
                ),
                title: Text(
                  "Vehicles",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChalanScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.money_dollar,
                  color: Colors.white,
                ),
                title: Text(
                  "Chalan",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => History()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.line_horizontal_3_decrease,
                  color: Colors.white,
                ),
                title: Text(
                  "History",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                final SharedPreferences prefs = await _prefs;
                final bool t1 = false;
                setState(() {
                  var log_info = prefs.remove('loggedInfo');
                  print("set t1 bvvv  ${t1}");
                });
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.person_badge_minus_fill,
                  color: Colors.white,
                ),
                title: Text(
                  "Logout",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
