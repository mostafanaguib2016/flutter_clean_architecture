import 'dart:async';

import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';

class LoginViewmodel extends BaseViewModel with LoginViewmodelInputs,LoginViewmodelOutputs {

  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();

  // inputs

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
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

  }
  @override
  setUserName(String userName) {

  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;


  // outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));

  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }
  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }


}

mixin LoginViewmodelInputs{
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;
  Sink get inputPassword;
}

mixin LoginViewmodelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
}