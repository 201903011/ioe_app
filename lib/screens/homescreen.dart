import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/models/lsi.dart';
import 'package:ioe_app/screens/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';

final List<String> imgList = [
  "assets/images/pm.jpg",
  "assets/images/mii.jpg",
  "assets/images/bse.jpg",
  "assets/images/nm.jpg",
  "assets/images/np.jpg",
];
final List<String> Info = [
  "Govt Schemes",
  "Make In India",
  "Invest in Stocks",
  "National Health Mission",
  "National Pension Scheme",
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.all(5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          '',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;
  late String s;
  List<Ic1> ic = <Ic1>[
    Ic1(const Icon(Icons.car_repair, size: 35), "Repair"),
    Ic1(const Icon(Icons.car_rental, size: 35), "Rent"),
    Ic1(const Icon(Icons.design_services, size: 35), "Service"),
    Ic1(const Icon(Icons.car_crash_sharp, size: 35), "Insurance"),
    Ic1(const Icon(Icons.account_balance, size: 35), "Maintain"),
  ];
  User user = User("", "", "", "", "", "", "");
  @override
  void initState() {
    super.initState();
    userget();
  }

  void userget() async {
    final SharedPreferences pref = await _prefs;
    s = pref.getString("user")!;
    user = User.fromJson(s);
    print(user);
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 14, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 3,
                    width: 29,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                  ),
                  SizedBox(height: 7, width: 10),
                  Container(
                    height: 3,
                    width: 13,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      drawer: MyDrawer(
        email: user.email,
        name: user.Name,
        url: user.url,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: imageSliders,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ic.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(59, 158, 158, 158),
                                shape: BoxShape.circle),
                            child: ic[index].icn,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                width: 70,
                                child: Center(
                                    child: Text(
                                  ic[index].str,
                                  style: MyStyle.header2(context, Colors.black),
                                ))),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Text(
                "Recommended for you",
                style: MyStyle.header1(context, Colors.black),
              ),
            ),
            Container(
              height: 5 * 130,
              child: ListView.builder(
                itemCount: imgList.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 16),
                    child: InkWell(
                      onTap: () {},
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
                                child: Image.asset(
                                  imgList[index],
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
                                  child: Container(
                                    width: 200,
                                    child: Text(
                                      Info[index],
                                      overflow: TextOverflow.ellipsis,
                                      style: MyStyle.header1(
                                          context, Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "see all",
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
          ],
        ),
      ),
    );
  }
}
