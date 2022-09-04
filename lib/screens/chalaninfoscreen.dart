// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/models/chalan.dart';
import 'package:ioe_app/screens/homescreen.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class ChalInfoScreen extends StatefulWidget {
  final Chalan chal;
  const ChalInfoScreen({Key? key, required this.chal}) : super(key: key);

  @override
  State<ChalInfoScreen> createState() => _ChalInfoScreenState();
}

class _ChalInfoScreenState extends State<ChalInfoScreen> {
  @override
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
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Vehicle no ",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(
                        widget.chal.number,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Date",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(
                        widget.chal.date,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Time",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(
                        widget.chal.time,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Status",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(
                        widget.chal.status,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Camera ID",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(
                        widget.chal.cameraid,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Amount",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Text(
                        "Rs " + widget.chal.amount,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      child: Text(
                        "Proof",
                        style: MyStyle.header1(context, Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(color: Colors.black),
                child: Image.network(widget.chal.url ??
                    "https://avatars.githubusercontent.com/u/72931833?s=96&v=4"),
              )
            ],
          ),
        ),
      ),
      bottomSheet: widget.chal.status == 'unpaid'
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    "Pay your Chalan",
                    style: MyStyle.header1(context, Colors.black),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () async {
                      try {
                        var db = mongo.Db('mongodb://10.0.2.2:27017/AChalan');
                        await db.open();
                        var chalanCollection = db.collection('chalan');
                        var x = widget.chal.toJson();
                        chalanCollection.updateOne(widget.chal.toMap(),
                            mongo.modify.set('status', 'paid'));

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("paid")));

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      } catch (e) {
                        print(e);
                        // ignore: prefer_const_constructors
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content:
                                const Text("There is some problem try again")));
                      } finally {}
                    },
                    // ignore: prefer_const_constructors
                    child: Icon(
                      Icons.payment,
                      size: 30,
                      color: const Color.fromARGB(255, 7, 49, 189),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
