import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/models/chalan.dart';
import 'package:ioe_app/models/vehicles.dart';

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
                      print("paid");

                      try {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("paid")));
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("There is some problem try again")));
                      } finally {}
                    },
                    child: Icon(
                      Icons.payment,
                      size: 30,
                      color: Color.fromARGB(255, 7, 49, 189),
                    ),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
