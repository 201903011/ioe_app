import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ioe_app/MyStyles.dart';
import 'package:ioe_app/models/vehicles.dart';

class VehInfoScreen extends StatefulWidget {
  final Vehicle vehicle;
  const VehInfoScreen({Key? key, required this.vehicle}) : super(key: key);

  @override
  State<VehInfoScreen> createState() => _VehInfoScreenState();
}

class _VehInfoScreenState extends State<VehInfoScreen> {
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
              Container(
                child: widget.vehicle.model == "Honda city"
                    ? Image.asset(
                        "assets/images/city.png",
                        fit: BoxFit.fitWidth,
                      )
                    : widget.vehicle.model == "Splender"
                        ? Image.asset(
                            "assets/images/splendor.jpg",
                            fit: BoxFit.fitWidth,
                          )
                        : Image.asset(
                            "assets/images/tata-curvv-ev.jpg",
                            fit: BoxFit.fitWidth,
                          ),
              ),
              SizedBox(
                height: 15,
              ),
              Info(title: "Vehicle no", info: widget.vehicle.vnumber),
              SizedBox(
                height: 25,
              ),
              Info(title: "Phone", info: widget.vehicle.phone),
              SizedBox(
                height: 25,
              ),
              Info(title: "Registration no", info: widget.vehicle.regno),
              SizedBox(
                height: 25,
              ),
              Info(title: "Chasis no", info: widget.vehicle.chasisno),
              SizedBox(
                height: 25,
              ),
              Info(title: "Engine no", info: widget.vehicle.engineno),
              SizedBox(
                height: 25,
              ),
              Info(title: "Reg date", info: widget.vehicle.regdate),
              SizedBox(
                height: 25,
              ),
              Info(title: "Owner", info: widget.vehicle.owner),
              SizedBox(
                height: 25,
              ),
              Info(title: "Vehicle class", info: widget.vehicle.vehicleclass),
              SizedBox(
                height: 25,
              ),
              Info(title: "Fuel", info: widget.vehicle.fuel),
              SizedBox(
                height: 25,
              ),
              Info(title: "Model", info: widget.vehicle.model),
              SizedBox(
                height: 25,
              ),
              Info(title: "Fitness", info: widget.vehicle.fitness),
              SizedBox(
                height: 25,
              ),
              Info(title: "Mv Tax", info: widget.vehicle.mvtax),
              SizedBox(
                height: 25,
              ),
              Info(title: "Insurance upto", info: widget.vehicle.insuranceupto),
              SizedBox(
                height: 25,
              ),
              Info(title: "PUCC", info: widget.vehicle.pucc),
              SizedBox(
                height: 25,
              ),
              Info(title: "Emission", info: widget.vehicle.emission),
              SizedBox(
                height: 25,
              ),
              Info(title: "RCStatus", info: widget.vehicle.rcstatus),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Info extends StatefulWidget {
  final String title;
  final String info;
  const Info({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Container(
            width: 120,
            child: Text(
              widget.title,
              style: MyStyle.header1(context, Colors.black),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            child: Text(
              widget.info,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
