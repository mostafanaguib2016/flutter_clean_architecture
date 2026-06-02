import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel with LoginViewmodelInputs,LoginViewmodelOutputs {

  // inputs

  @override
  void dispose() {
    // TODO: implement dispose
  }
  @override
  void start() {
    // TODO: implement start
  }

  @override
  login() {

  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword
    return super.setPassword(password);
  }
  @override
  setUserName(String userName) {
    // TODO: implement setUserName
    return super.setUserName(userName);
  }

  @override
  Sink<dynamic> get inputPassword => throw UnimplementedError();

  @override
  Sink<dynamic> get inputUserName => throw UnimplementedError();


  // outputs
  @override
  Stream<bool> get outIsPasswordValid => throw UnimplementedError();

  @override
  Stream<bool> get outIsUserNameValid => throw UnimplementedError();

}

mixin LoginViewmodelInputs{
  setUserName(String userName){

  }

  setPassword(String password){

  }

  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

mixin LoginViewmodelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}