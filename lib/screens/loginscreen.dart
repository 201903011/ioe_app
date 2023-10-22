import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ioe_app/constant.dart';

import 'package:otp/otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'verified.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool changebutton = false;
  String number = "";

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;
  final _formkey = GlobalKey<FormState>();

  moveTohome(BuildContext context) async {
    final SharedPreferences pref = await _prefs;
    bool valid = false;

    if (_formkey.currentState!.validate()) {
      var db = await mongo.Db.create(dbConn);
      await db.open();
      var usersCollection = db.collection('users');
      var x = await usersCollection.findOne(mongo.where.eq('phone', number));
      var en = jsonEncode(x);
      print(en.toString());
      if (x == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please used register number")));
        return;
      }
      final bool t1 = true;
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      print(number);
      final otp = OTP.generateTOTPCodeString(
          "secret", DateTime.now().millisecondsSinceEpoch);
      print(otp);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VerifiedScreen(
                    number: number,
                    otp: otp,
                    user: en.toString(),
                  )));

      setState(() {
        changebutton = false;
      });
    } else {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => VerifiedScreen(
      //       number: number,
      //       otp: "999999",
      //       user: "",
      //     ),
      //   ),
      // );
    }

    // pref.setBool('loggedInfo', true);
    // setState(() {
    //   changebutton = true;
    // });
    // await Future.delayed(Duration(seconds: 1));
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            ),
            Text(
              "Welcome ",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Mobile no",
                        labelText: "Mobile number",
                      ),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please enter mobile number";
                        }
                        if (value.length != 10) {
                          return "Must be 10 digits";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        number = value;
                      },
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Material(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular(changebutton ? 50 : 8.0),
                      child: InkWell(
                        onTap: () => moveTohome(context),
                        child: AnimatedContainer(
                          width: changebutton ? 50 : 150,
                          height: 50,
                          alignment: Alignment.center,
                          duration: Duration(seconds: 1),
                          child: changebutton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Get otp",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
