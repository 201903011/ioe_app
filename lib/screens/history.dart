import 'package:flutter/material.dart';
import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/screens/chalaninfoscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import '../models/chalan.dart';
import '../models/user.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<bool> log_info;
  late String s;
  List<Chalan> chalan = <Chalan>[];
  User user = new User("", "", "", "", "", "", "");
  @override
  void initState() {
    super.initState();
    userget();
  }

  void getChalans(String ph) async {
    // chalan = List.from().map<Chalan>((item) => Chalan.fromMap(item)).toList();
  }

  void userget() async {
    final SharedPreferences pref = await _prefs;
    s = pref.getString("user")!;
    User u1 = User.fromJson(s);
    // print(user);

    List<Chalan> chal1 = <Chalan>[];
    var db = mongo.Db('mongodb://10.0.2.2:27017/AChalan');
    await db.open();
    var chalanCollection = db.collection('chalan');

    var x = await chalanCollection.find(mongo.where
        .eq('phone', u1.phone)
        .and(mongo.where.eq('status', 'paid')));
    print(u1.phone);
    x.forEach((element) {
      Chalan ch;
      ch = Chalan.fromMap(element);
      chal1.add(ch);
      print(ch);
    });
    print(chalan);

    setState(() {
      user = u1;
      chalan = chal1;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: chalan.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(32),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChalInfoScreen(
                                chal: chalan[index],
                              )));
                },
                title: Text(
                  chalan[index].number,
                  style: MyStyle.header1(context, Colors.black),
                ),
                subtitle: Text("Rs " + chalan[index].amount),
                leading: Text(chalan[index].date),
                trailing: Column(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
