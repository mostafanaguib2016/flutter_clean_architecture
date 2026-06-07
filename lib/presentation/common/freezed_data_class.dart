import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';


@freezed
abstract class LoginObject with _$LoginObject {
  const factory LoginObject(
      String userName,
      String password,
      ) = _LoginObject;
}

@freezed
abstract class RegisterObject with _$RegisterObject {
  const factory RegisterObject(
      String userName,
      String countryCode,
      String mobileNumber,
      String email,
      String password,
      String profilePicture,
      ) = _RegisterObject;
}