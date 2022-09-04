// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Chalan {
  final String phone;
  final String number;
  final String rfid;
  final String cameraid;
  final String amount;
  final String time;
  final String date;
  final String status;
  final String url;
  Chalan(
    this.phone,
    this.number,
    this.rfid,
    this.cameraid,
    this.amount,
    this.time,
    this.date,
    this.status,
    this.url,
  );

  Chalan copyWith({
    String? phone,
    String? number,
    String? rfid,
    String? cameraid,
    String? amount,
    String? time,
    String? date,
    String? status,
    String? url,
  }) {
    return Chalan(
      phone ?? this.phone,
      number ?? this.number,
      rfid ?? this.rfid,
      cameraid ?? this.cameraid,
      amount ?? this.amount,
      time ?? this.time,
      date ?? this.date,
      status ?? this.status,
      url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'phone': phone,
      'number': number,
      'rfid': rfid,
      'cameraid': cameraid,
      'amount': amount,
      'time': time,
      'date': date,
      'status': status,
      'url': url,
    };
  }

  factory Chalan.fromMap(Map<String, dynamic> map) {
    return Chalan(
      map['phone'] as String,
      map['number'] as String,
      map['rfid'] as String,
      map['cameraid'] as String,
      map['amount'] as String,
      map['time'] as String,
      map['date'] as String,
      map['status'] as String,
      map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Chalan.fromJson(String source) =>
      Chalan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Chalan(phone: $phone, number: $number, rfid: $rfid, cameraid: $cameraid, amount: $amount, time: $time, date: $date, status: $status, url: $url)';
  }

  @override
  bool operator ==(covariant Chalan other) {
    if (identical(this, other)) return true;

    return other.phone == phone &&
        other.number == number &&
        other.rfid == rfid &&
        other.cameraid == cameraid &&
        other.amount == amount &&
        other.time == time &&
        other.date == date &&
        other.status == status &&
        other.url == url;
  }

  @override
  int get hashCode {
    return phone.hashCode ^
        number.hashCode ^
        rfid.hashCode ^
        cameraid.hashCode ^
        amount.hashCode ^
        time.hashCode ^
        date.hashCode ^
        status.hashCode ^
        url.hashCode;
  }
}
