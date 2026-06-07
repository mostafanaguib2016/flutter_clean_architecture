import 'dart:async';
import 'dart:io';

import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs,RegisterViewModelOutputs {

  StreamController userNameStreamController = StreamController<String>.broadcast();
  StreamController mobileNumberStreamController = StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController = StreamController<String>.broadcast();
  StreamController profilePictureStreamController = StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController = StreamController<void>.broadcast();

  @override
  // TODO: implement inputAreAllInputsValid
  Sink<dynamic> get inputAreAllInputsValid => throw UnimplementedError();

  @override
  // TODO: implement inputPassword
  Sink<dynamic> get inputPassword => throw UnimplementedError();

  @override
  // TODO: implement inputUserName
  Sink<dynamic> get inputUserName => throw UnimplementedError();

  @override
  // TODO: implement outAreAllInputsValid
  Stream<bool> get outAreAllInputsValid => throw UnimplementedError();

  @override
  // TODO: implement outIsPasswordValid
  Stream<bool> get outIsPasswordValid => throw UnimplementedError();

  @override
  // TODO: implement outIsUserNameValid
  Stream<bool> get outIsUserNameValid => throw UnimplementedError();

  @override
  register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  setPassword(String password) {
    // TODO: implement setPassword

  }

  @override
  setUserName(String userName) {
    // TODO: implement setUserName
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void dispose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsValidStreamController.close();
    super.dispose();
  }

}

mixin RegisterViewModelInputs{

  setUserName(String userName);
  setPassword(String password);

  register();

  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputAreAllInputsValid;
}

mixin RegisterViewModelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outAreAllInputsValid;
}