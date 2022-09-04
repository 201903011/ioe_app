// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Vehicle {
  final String vnumber;
  final String rfid;
  final String phone;
  final String regno;
  final String chasisno;
  final String engineno;
  final String regdate;
  final String owner;
  final String vehicleclass;
  final String fuel;
  final String model;
  final String fitness;
  final String mvtax;
  final String insuranceupto;
  final String pucc;
  final String emission;
  final String rcstatus;

  // "regno" : "KA2562",
  //       "chasisno" : "CS0000" ,
  //       "engineno" : "ENG001",
  //       "regdate" : "10/01/2021",
  //       "owner" : "Rahul Kishor Gaikwad",
  //       "vehicleclass" : "M-Cycle/Scooter" ,
  //       "fuel" : "Petrol" ,
  //       "model" : "Honda city" ,
  //       "fitness" : "012401" ,
  //       "mvtax" : "LTT" ,
  //       "insuranceupto" : "19/10/2022" ,
  //       "pucc" : "NA" ,
  //       "emission" : "NA" ,
  //       "rcstatus" : "Active"
  Vehicle(
    this.vnumber,
    this.rfid,
    this.phone,
    this.regno,
    this.chasisno,
    this.engineno,
    this.regdate,
    this.owner,
    this.vehicleclass,
    this.fuel,
    this.model,
    this.fitness,
    this.mvtax,
    this.insuranceupto,
    this.pucc,
    this.emission,
    this.rcstatus,
  );

  Vehicle copyWith({
    String? vnumber,
    String? rfid,
    String? phone,
    String? regno,
    String? chasisno,
    String? engineno,
    String? regdate,
    String? owner,
    String? vehicleclass,
    String? fuel,
    String? model,
    String? fitness,
    String? mvtax,
    String? insuranceupto,
    String? pucc,
    String? emission,
    String? rcstatus,
  }) {
    return Vehicle(
      vnumber ?? this.vnumber,
      rfid ?? this.rfid,
      phone ?? this.phone,
      regno ?? this.regno,
      chasisno ?? this.chasisno,
      engineno ?? this.engineno,
      regdate ?? this.regdate,
      owner ?? this.owner,
      vehicleclass ?? this.vehicleclass,
      fuel ?? this.fuel,
      model ?? this.model,
      fitness ?? this.fitness,
      mvtax ?? this.mvtax,
      insuranceupto ?? this.insuranceupto,
      pucc ?? this.pucc,
      emission ?? this.emission,
      rcstatus ?? this.rcstatus,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'vnumber': vnumber,
      'rfid': rfid,
      'phone': phone,
      'regno': regno,
      'chasisno': chasisno,
      'engineno': engineno,
      'regdate': regdate,
      'owner': owner,
      'vehicleclass': vehicleclass,
      'fuel': fuel,
      'model': model,
      'fitness': fitness,
      'mvtax': mvtax,
      'insuranceupto': insuranceupto,
      'pucc': pucc,
      'emission': emission,
      'rcstatus': rcstatus,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      map['vnumber'] as String,
      map['rfid'] as String,
      map['phone'] as String,
      map['regno'] as String,
      map['chasisno'] as String,
      map['engineno'] as String,
      map['regdate'] as String,
      map['owner'] as String,
      map['vehicleclass'] as String,
      map['fuel'] as String,
      map['model'] as String,
      map['fitness'] as String,
      map['mvtax'] as String,
      map['insuranceupto'] as String,
      map['pucc'] as String,
      map['emission'] as String,
      map['rcstatus'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Vehicle.fromJson(String source) =>
      Vehicle.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Vehicle(vnumber: $vnumber, rfid: $rfid, phone: $phone, regno: $regno, chasisno: $chasisno, engineno: $engineno, regdate: $regdate, owner: $owner, vehicleclass: $vehicleclass, fuel: $fuel, model: $model, fitness: $fitness, mvtax: $mvtax, insuranceupto: $insuranceupto, pucc: $pucc, emission: $emission, rcstatus: $rcstatus)';
  }

  @override
  bool operator ==(covariant Vehicle other) {
    if (identical(this, other)) return true;

    return other.vnumber == vnumber &&
        other.rfid == rfid &&
        other.phone == phone &&
        other.regno == regno &&
        other.chasisno == chasisno &&
        other.engineno == engineno &&
        other.regdate == regdate &&
        other.owner == owner &&
        other.vehicleclass == vehicleclass &&
        other.fuel == fuel &&
        other.model == model &&
        other.fitness == fitness &&
        other.mvtax == mvtax &&
        other.insuranceupto == insuranceupto &&
        other.pucc == pucc &&
        other.emission == emission &&
        other.rcstatus == rcstatus;
  }

  @override
  int get hashCode {
    return vnumber.hashCode ^
        rfid.hashCode ^
        phone.hashCode ^
        regno.hashCode ^
        chasisno.hashCode ^
        engineno.hashCode ^
        regdate.hashCode ^
        owner.hashCode ^
        vehicleclass.hashCode ^
        fuel.hashCode ^
        model.hashCode ^
        fitness.hashCode ^
        mvtax.hashCode ^
        insuranceupto.hashCode ^
        pucc.hashCode ^
        emission.hashCode ^
        rcstatus.hashCode;
  }
}
