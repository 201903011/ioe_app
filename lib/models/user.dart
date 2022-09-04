// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ioe_app/models/vehicles.dart';

class User {
  final String adhar;
  final String phone;
  final String Name;
  final String address;
  final String licenseno;
  final String email;
  final String url;

  User(
    this.adhar,
    this.phone,
    this.Name,
    this.address,
    this.licenseno,
    this.email,
    this.url,
  );

  User copyWith({
    String? adhar,
    String? phone,
    String? Name,
    String? address,
    String? licenseno,
    String? email,
    String? url,
  }) {
    return User(
      adhar ?? this.adhar,
      phone ?? this.phone,
      Name ?? this.Name,
      address ?? this.address,
      licenseno ?? this.licenseno,
      email ?? this.email,
      url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adhar': adhar,
      'phone': phone,
      'Name': Name,
      'address': address,
      'licenseno': licenseno,
      'email': email,
      'url': url,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['adhar'] as String,
      map['phone'] as String,
      map['Name'] as String,
      map['address'] as String,
      map['licenseno'] as String,
      map['email'] as String,
      map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(adhar: $adhar, phone: $phone, Name: $Name, address: $address, licenseno: $licenseno, email: $email, url: $url)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.adhar == adhar &&
        other.phone == phone &&
        other.Name == Name &&
        other.address == address &&
        other.licenseno == licenseno &&
        other.email == email &&
        other.url == url;
  }

  @override
  int get hashCode {
    return adhar.hashCode ^
        phone.hashCode ^
        Name.hashCode ^
        address.hashCode ^
        licenseno.hashCode ^
        email.hashCode ^
        url.hashCode;
  }
}
