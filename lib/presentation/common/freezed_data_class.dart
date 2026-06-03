import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_class.freezed.dart';


@freezed
class LoginObject with _$LoginObject{
  factory LoginObject(String userName,String password) = _LoginObject;

  @override
  String get password => password;

  @override
  String get userName => userName;
}