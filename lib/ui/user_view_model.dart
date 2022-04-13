import 'package:firebase_auth/firebase_auth.dart';
import 'package:glassbalconyanalysis/data/model/app_user.dart';
import 'package:glassbalconyanalysis/data/repository/auth_repository.dart';
import 'package:glassbalconyanalysis/data/repository/auth_repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userViewModelProvider = ChangeNotifierProvider((ref) => UserViewModel(ref.read));

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._reader);

  final Reader _reader;

  late final AuthRepository _repository = _reader(authRepositoryProvider);

  //get auth user from firebase
  AppUser? _user = AppUser.from(FirebaseAuth.instance.currentUser);

  AppUser? get user => _user;

  bool get isAuthenticated => _user != null;

  Future<void> signIn() {
    return _repository.signIn().then((result) {
      // Result use case No.2
      result.ifSuccess((data) {
        _user = data;
        notifyListeners();
      });
    });
  }

  Future<void> signOut() {
    return _repository.signOut().then((result) {
      return result.when(
        success: (_) {
          _user = null;
          notifyListeners();
        },
        failure: (_) => result,
      );
    });
  }
}
