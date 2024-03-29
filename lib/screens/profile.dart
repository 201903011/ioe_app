import 'package:flutter/material.dart';

import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/constant.dart';
import 'package:ioe_app/models/vehicles.dart';
import 'package:ioe_app/screens/vehiclesinformation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

import '../models/user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;
  late String s;
  List<Vehicle> veh = <Vehicle>[];
  User user = new User("", "", "", "", "", "", "");
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map mymap = await userget();
      // setState(() {});
      setState(() {
        user = mymap["user"];
        veh = mymap["vehicle"];
      });
    });
  }

  Future<Map> userget() async {
    final SharedPreferences pref = await _prefs;
    s = await pref.getString("user")!;
    User u1 = await User.fromJson(s);
    List<Vehicle> vl = <Vehicle>[];
    var db = await mongo.Db.create(dbConn);

    await db.open();
    var vehicleCollection = await db.collection('vehicles');
    var x = await vehicleCollection.find(mongo.where.eq('phone', u1.phone));
    await x.forEach((element) {
      Vehicle vh;
      vh = Vehicle.fromMap(element);
      vl.add(vh);
      print(vh);
    });

    // Future<List<Vehicle>> toaddlist = x.map((e) => Vehicle.fromMap(e)).toList();

    print(u1);
    print(x);
    print(vl);

    return {"user": u1, "vehicle": vl};
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(50)),
                      child: user.url != "" && user.url != null
                          ? Image.network(user.url)
                          : Container(),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.Name,
                        style: MyStyle.header1(context, Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(user.email),
                      SizedBox(
                        height: 10,
                      ),
                      Text(user.phone)
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Info(title: "Adhar", info: user.adhar),
              SizedBox(
                height: 25,
              ),
              Info(title: "Address", info: user.address),
              SizedBox(
                height: 25,
              ),
              Info(title: "License", info: user.licenseno),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vehicles",
                      style: MyStyle.header1(context, Colors.black),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 400,
                      child: ListView.builder(
                        itemCount: veh.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VehInfoScreen(
                                              vehicle: veh[index],
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(50, 158, 158, 158),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0, horizontal: 15),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: veh[index].model == "Honda city"
                                            ? Image.asset(
                                                "assets/images/city.png",
                                                fit: BoxFit.fitWidth,
                                              )
                                            : veh[index].model == "Splender"
                                                ? Image.asset(
                                                    "assets/images/splendor.jpg",
                                                    fit: BoxFit.fitWidth,
                                                  )
                                                : Image.asset(
                                                    "assets/images/tata-curvv-ev.jpg",
                                                    fit: BoxFit.fitWidth,
                                                  ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 16.0),
                                          child: Text(
                                            veh[index].model,
                                            style: MyStyle.header1(
                                                context, Colors.black),
                                          ),
                                        ),
                                        Text(
                                          veh[index].vnumber,
                                          style: MyStyle.header2(
                                              context, Colors.black),
                                        ),
                                        Text(
                                          veh[index].fuel,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
