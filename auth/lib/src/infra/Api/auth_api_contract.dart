import 'package:async/async.dart';
import 'package:auth/src/domain/credentials.dart';

abstract class IAuthApi{
  Future<Result<String>> signIn(Credential credential);
  Future<Result<String>> signUp(Credential credential);
}