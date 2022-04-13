import 'package:glassbalconyanalysis/data/model/app_user.dart';
import 'package:glassbalconyanalysis/data/model/result.dart';

abstract class AuthRepository {
  Future<Result<AppUser>> signIn();

  Future<Result<void>> signOut();
}
