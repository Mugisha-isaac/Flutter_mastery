
import 'package:async/async.dart';
import 'package:auth/src/domain/auth_service_contract.dart';
import 'package:auth/src/domain/credentials.dart';
import 'package:auth/src/domain/signup_service_contract.dart';
import 'package:auth/src/domain/token.dart';
import 'package:auth/src/infra/Api/auth_api_contract.dart';

class EmailAuth implements IAuthService, ISignUpService{

final IAuthApi _api;
Credential _credential;
EmailAuth(this._api);

  @override
  Future<Result<Token>> signIn() async {
    try {
      var result = await _api.signIn(_credential);
      return Result<Token>.value(Token(result.asValue!.value));
    } catch (e) {
      return Result<Token>.error(e.toString());
    }
  }


  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<Result<Token>> signUp(String name, String email, String password) async{
    Credential credential = Credential(type: AuthType.email, email: email, name: name, password: password);
    try{
      var result = await _api.signUp(credential);
      return Result<Token>.value(Token(result.asValue!.value));
    }
    catch(e){
      return Result<Token>.error(e.toString());
    }
  }
   
}