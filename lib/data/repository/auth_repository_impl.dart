import 'package:firebase_auth/firebase_auth.dart';
import 'package:glassbalconyanalysis/data/model/app_user.dart';
import 'package:glassbalconyanalysis/data/model/result.dart';
import 'package:glassbalconyanalysis/data/repository/auth_repository.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthRepositoryImpl implements AuthRepository {

  late final firebase.FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Result<AppUser>> signIn() async {
    final account = await GoogleSignIn().signIn();
    if (account == null) {
      return throw StateError('Maybe user canceled.');
    }
    final auth = await account.authentication;
    final firebase.AuthCredential authCredential =
    firebase.GoogleAuthProvider.credential(
      idToken: auth.idToken,
      accessToken: auth.accessToken,
    );

    final credential = await _firebaseAuth.signInWithCredential(authCredential);
    final currentUser = await firebase.FirebaseAuth.instance.currentUser;
    assert(credential.user?.uid == currentUser?.uid);

    return Result.guardFuture(() async => AppUser.from(credential.user));
  }

  @override
  Future<Result<void>> signOut() {
    return Result.guardFuture(_firebaseAuth.signOut);
  }
}
