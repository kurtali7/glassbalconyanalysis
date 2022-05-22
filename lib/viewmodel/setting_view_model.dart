import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mobx/mobx.dart';

import '../data/model/app_user.dart';
import '../data/repository/auth_repository.dart';
import '../data/repository/auth_repository_impl.dart';
import '../data/repository/user_repository.dart';
import '../data/repository/user_repository_impl.dart';
part 'setting_view_model.g.dart';

class SettingViewModel = _SettingViewModelBase with _$SettingViewModel;

abstract class _SettingViewModelBase with Store {

  late final AuthRepository _repository = AuthRepositoryImpl();
  late final UserRepository _userrepository = UserRepositoryImpl();

  @observable
  AppUser? user;

  @observable
  bool isAuthenticated = FirebaseAuth.instance.currentUser!=null ? true : false;

  @action
  Future<void> getAuthUser() async {
      return await _userrepository.loginUser(FirebaseAuth.instance.currentUser).then((value) => user);
  }

  @action
  Future<void> signIn() async {
    return await _repository.signIn().then((result) {
      result.ifSuccess((data) {
        user = data;
        isAuthenticated = true;
        getAuthUser();
      });
    });
  }

  @action
  Future<void> signOut() {
    return _repository.signOut().then((result) {
      return result.when(
        success: (_) {
          user = null;
          isAuthenticated = false;
        },
        failure: (_) => result,
      );
    });
  }
}
