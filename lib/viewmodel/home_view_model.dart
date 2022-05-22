import 'package:firebase_auth/firebase_auth.dart';
import 'package:glassbalconyanalysis/data/repository/user_repository_impl.dart';
import 'package:mobx/mobx.dart';

import '../data/model/app_user.dart';
import '../data/repository/user_repository.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  late final UserRepository _userrepository = UserRepositoryImpl();

  //get auth user from firebase
  AppUser? _user = AppUser.from(FirebaseAuth.instance.currentUser);

  @observable
  AppUser? get user => _user;

  @observable
  bool get isAuthenticated => _user != null;

  @action
  Future<void> loginUser() {
    return _userrepository.loginUser(FirebaseAuth.instance.currentUser).then((value) => _user);
  }
}