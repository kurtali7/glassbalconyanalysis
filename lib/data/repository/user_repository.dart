import 'package:firebase_auth/firebase_auth.dart';

import '../model/app_user.dart';

abstract class UserRepository {
  Future<AppUser?> loginUser(User? user);
}
