import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/base_functions.dart';
import 'package:flutter_clean_architecture/domain/usecase/register_usecase.dart';
import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/common/freezed_data_class.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer.dart';
import 'package:flutter_clean_architecture/presentation/common/state_renderer/state_renderer_impl.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

class RegisterViewModel extends BaseViewModel
    with RegisterViewModelInputs,RegisterViewModelOutputs {

  StreamController userNameStreamController = StreamController<String>.broadcast();
  StreamController mobileNumberStreamController = StreamController<String>.broadcast();
  StreamController emailStreamController = StreamController<String>.broadcast();
  StreamController passwordStreamController = StreamController<String>.broadcast();
  StreamController profilePictureStreamController = StreamController<File>.broadcast();
  StreamController areAllInputsValidStreamController = StreamController<void>.broadcast();
  final StreamController isUserRegisteredSuccessfullyStreamController = StreamController<void>();

  var registerObject = RegisterObject("","","","","","",);

  final RegisterUseCase _registerUseCase;
  RegisterViewModel(this._registerUseCase);

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if(_isPasswordValid(password)){
      registerObject = registerObject.copyWith(password: password);
    }else{
      registerObject = registerObject.copyWith(password: "");
    }
    validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if(_isUserNameValid(userName)){
      registerObject = registerObject.copyWith(userName: userName);
    }else{
      registerObject = registerObject.copyWith(userName: "");
    }
    validate();
  }

  @override
  setCountryCode(String countryCode) {
    if(countryCode.isNotEmpty){
      registerObject = registerObject.copyWith(countryCode: countryCode);
    }else{
      registerObject = registerObject.copyWith(countryCode: "");
    }
    validate();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if(isEmailValid(email)){
      registerObject = registerObject.copyWith(email: email);
    }else{
      registerObject = registerObject.copyWith(email: "");
    }
    validate();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if(_isMobileNumberValid(mobileNumber)){
      registerObject = registerObject.copyWith(mobileNumber: mobileNumber);
    }else{
      registerObject = registerObject.copyWith(mobileNumber: "");
    }
    validate();
  }

  @override
  setProfilePicture(File profilePicture) {
    inputProfilePicture.add(profilePicture);
    if(profilePicture != null && profilePicture.path.isNotEmpty){
      registerObject = registerObject.copyWith(profilePicture: profilePicture.path);
    }else{
      registerObject = registerObject.copyWith(profilePicture: "");
    }
    validate();
  }


  @override
  void start() {
    // TODO: implement start
  }

  @override
  register() async{
    inputState.add(LoadingState(stateRendererType: StateRendererType.popupLoadingState));
    (await
    _registerUseCase.execute(
        RegisterUseCaseInput(
            registerObject.userName, registerObject.countryCode,
            registerObject.mobileNumber, registerObject.email,
            registerObject.password, registerObject.profilePicture
        ))).fold(
          (failure) =>{
        inputState.add(ErrorState(StateRendererType.popupErrorState,failure.message)),
        debugPrint("ERROR ==>  ${failure.message}  ${failure.code}")
      },
          (data) =>{
        inputState.add(ContentState()),
        isUserRegisteredSuccessfullyStreamController.add(true)
      },
    );
  }


  @override
  void dispose() {
    userNameStreamController.close();
    mobileNumberStreamController.close();
    emailStreamController.close();
    passwordStreamController.close();
    profilePictureStreamController.close();
    areAllInputsValidStreamController.close();
    isUserRegisteredSuccessfullyStreamController.close();
    super.dispose();
  }

  // inputs
  @override
  Sink get inputAreAllInputsValid => areAllInputsValidStreamController.sink;

  @override
  Sink get inputEmail => emailStreamController.sink;

  @override
  Sink get inputMobileNumber => mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => passwordStreamController.sink;

  @override
  Sink get inputProfilePicture => profilePictureStreamController.sink;

  @override
  Sink get inputUserName => userNameStreamController.sink;

  //outputs

  @override
  Stream<bool> get outIsUserNameValid => userNameStreamController.stream.map((userName)=> _isUserNameValid(userName));
  @override
  Stream<String?> get outErrorUserName => outIsUserNameValid.map((isUserNameValid) =>
  isUserNameValid ? null : AppStrings.userNameInvalid.tr());

  @override
  Stream<bool> get outIsMobileNumberValid => mobileNumberStreamController.stream.map((mobileNumber) => _isMobileNumberValid(mobileNumber));
  @override
  Stream<String?> get outErrorMobileNumber => outIsMobileNumberValid.map((isMobileNumberValid) =>
  isMobileNumberValid ? null : AppStrings.mobileNumberInvalid.tr());

  @override
  Stream<bool> get outIsEmailValid => emailStreamController.stream.map((email)=> isEmailValid(email));
  @override
  Stream<String?> get outErrorEmail => outIsEmailValid.map((isEmailValid) =>
  isEmailValid ? null : AppStrings.invalidEmail.tr());

  @override
  Stream<bool> get outIsPasswordValid => passwordStreamController.stream.map((password) =>
      _isPasswordValid(password));
  @override
  Stream<String?> get outErrorPassword => outIsPasswordValid.map((isPasswordValid) =>
  isPasswordValid ? null : AppStrings.passwordInvalid.tr()
  );

  @override
  Stream<File> get outProfilePicture => profilePictureStreamController.stream.map((file) => file);

  @override
  Stream<bool> get outAreAllInputsValid => areAllInputsValidStreamController.stream.map((_) => _areAllValid());

  // validation functions

  bool _isUserNameValid(String userName) {
    return userName.length >= 8;
  }

  bool _isMobileNumberValid(String mobileNumber) {
    return mobileNumber.length >= 10;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  bool _areAllValid(){
    return registerObject.userName.isNotEmpty &&
        registerObject.email.isNotEmpty &&
        registerObject.mobileNumber.isNotEmpty &&
        registerObject.password.isNotEmpty &&
        registerObject.profilePicture.isNotEmpty &&
        registerObject.countryCode.isNotEmpty ;
  }

  validate(){
    inputAreAllInputsValid.add(null);
  }

}

mixin RegisterViewModelInputs{

  setUserName(String userName);
  setMobileNumber(String mobileNumber);
  setCountryCode(String countryCode);
  setEmail(String email);
  setPassword(String password);
  setProfilePicture(File profilePicture);

  register();

  Sink get inputUserName;
  Sink get inputMobileNumber;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputProfilePicture;
  Sink get inputAreAllInputsValid;

}

mixin RegisterViewModelOutputs{
  Stream<bool> get outIsUserNameValid;
  Stream<String?> get outErrorUserName;

  Stream<bool> get outIsMobileNumberValid;
  Stream<String?> get outErrorMobileNumber;

  Stream<bool> get outIsEmailValid;
  Stream<String?> get outErrorEmail;

  Stream<bool> get outIsPasswordValid;
  Stream<String?> get outErrorPassword;

  Stream<File> get outProfilePicture;

  Stream<bool> get outAreAllInputsValid;
}