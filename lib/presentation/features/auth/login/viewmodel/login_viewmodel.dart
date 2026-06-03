import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/domain/usecase/login_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/common/freezed_data_class.dart';

class LoginViewmodel extends BaseViewModel with LoginViewmodelInputs,LoginViewmodelOutputs {

  final StreamController _userNameStreamController = StreamController<String>.broadcast();
  final StreamController _passwordStreamController = StreamController<String>.broadcast();
  final StreamController _areAllInputsValidStreamController = StreamController<void>.broadcast();


  var loginObject = LoginObject("","");
  final LoginUseCase _loginUseCase;
  LoginViewmodel(this._loginUseCase);

  // inputs

  @override
  void dispose() {
    _passwordStreamController.close();
    _userNameStreamController.close();
    _areAllInputsValidStreamController.close();
  }
  @override
  void start() {
    // TODO: implement start
  }

  @override
  login() async{
    (await _loginUseCase.execute(LoginUseCaseInput(loginObject.userName, loginObject.password))).fold(
        (failure) =>{
          debugPrint("${failure.message}  ${failure.code}")
        },
      (data) =>{

      },
    );
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }
  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject = loginObject.copyWith(userName: userName);
    inputAreAllInputsValid.add(null);
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;
  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;


  // outputs
  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream.map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outIsUserNameValid => _userNameStreamController.stream.map((userName) => _isUserNameValid(userName));
  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => _areAllInputsValid());


  bool _isPasswordValid(String password){
    return password.isNotEmpty;
  }
  bool _isUserNameValid(String userName){
    return userName.isNotEmpty;
  }
  bool _areAllInputsValid() {
    return _isPasswordValid(loginObject.password) &&
        _isUserNameValid(loginObject.userName);
  }

}

mixin LoginViewmodelInputs{
  setUserName(String userName);

  setPassword(String password);

  login();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

mixin LoginViewmodelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}