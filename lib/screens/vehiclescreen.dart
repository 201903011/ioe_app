import 'package:flutter/material.dart';
import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/screens/vehiclesinformation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

import '../models/user.dart';
import '../models/vehicles.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;
  late String s;
  List<Vehicle> veh = <Vehicle>[];
  User user = new User("", "", "", "", "", "", "");
  @override
  void initState() {
    super.initState();
    userget();
  }

  void userget() async {
    final SharedPreferences pref = await _prefs;
    s = pref.getString("user")!;
    User u1 = User.fromJson(s);
    List<Vehicle> vl = <Vehicle>[];
    var db = mongo.Db('mongodb://10.0.2.2:27017/AChalan');
    await db.open();
    var vehicleCollection = db.collection('vehicles');
    var x = await vehicleCollection.find(mongo.where.eq('phone', u1.phone));
    x.forEach((element) {
      Vehicle vh;
      vh = Vehicle.fromMap(element);
      vl.add(vh);
    });
    print(user);
    setState(() {
      user = u1;
      veh = vl;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                            borderRadius: BorderRadius.circular(15),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              veh[index].model,
                              style: MyStyle.header1(context, Colors.black),
                            ),
                          ),
                          Text(
                            veh[index].vnumber,
                            style: MyStyle.header2(context, Colors.black),
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
      ),
    );
  }
}
