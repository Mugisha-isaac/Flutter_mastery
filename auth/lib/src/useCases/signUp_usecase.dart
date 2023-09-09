import 'package:async/async.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:auth/src/domain/token.dart';

class SignUpUseCase{
  final ISignUpService _iSignUpService;
  SignUpUseCase(this._iSignUpService);
  Future<Result<Token>> execute(String name, String email, String password) async{
    return await _iSignUpService.signUp(name, email, password);
  }
}