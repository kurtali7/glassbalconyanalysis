import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassbalconyanalysis/data/model/company.dart';
import 'package:glassbalconyanalysis/data/model/enum/currency.dart';
import 'package:glassbalconyanalysis/data/model/enum/user_type.dart';

class AppUser {
  String id;
  String? uId;
  String? imageUrl;
  String? name;
  String? mail;
  DateTime endDate;
  String paketType;
  Currency currency;
  UserType userType;
  Company? company;

  AppUser(this.id, this.uId, this.imageUrl, this.name, this.mail, this.endDate,
      this.paketType, this.currency, this.userType, this.company);

  factory AppUser.from(User? firebaseUser) {
    return AppUser(
        '0',
        firebaseUser?.uid,
        firebaseUser?.photoURL,
        firebaseUser?.displayName,
        firebaseUser?.email,
        new DateTime.now(),
        'Deneme Sürümü',
        Currency.TL,
        UserType.GENEL,
        null
    );
  }

  factory AppUser.fromFirestore(DocumentSnapshot doc, User? user) {
    AppUser t = AppUser(
        doc["id"],
        user?.uid,
        user?.photoURL,
        doc["name"],
        user?.email,
        new DateTime.now(),
        doc["paketType"],
        Currency.values.byName(doc["currency"] ?? "TL"),
        UserType.values.byName(doc["userType"] ?? "GENEL"),
        null
    );

    return t;
  }
}
