import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassbalconyanalysis/data/repository/user_repository.dart';

import '../model/app_user.dart';

class UserRepositoryImpl implements UserRepository {
  late final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  @override
  Future<AppUser?> loginUser(User? user) async {
    if(user==null)
      return null;

    return await _firebase
            .collection("users")
            .where("mail", isEqualTo: user.email)
            .get()
            .then((QuerySnapshot querySnapshot) {
          if (querySnapshot.size > 0) {
            querySnapshot.docs.forEach((doc) {
              debugPrint("geldi44444");
              AppUser.fromFirestore(doc, user);
            });
          }
        });
  }
}
