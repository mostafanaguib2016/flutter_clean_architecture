import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/usecase/base_usecase.dart';

class RegisterUseCase implements BaseUseCase<RegisterUseCaseInput,Authentication> {

  final Repository _repository;
  RegisterUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(RegisterUseCaseInput input) async{
    return await _repository.register((RegisterRequest(
      input.userName,input.countryCode,input.mobileNumber,input.email,
      input.password,input.profilePicture
    )));
  }

}

class RegisterUseCaseInput {
  String userName;
  String countryCode;
  String mobileNumber;
  String email;
  String password;
  String profilePicture;

  RegisterUseCaseInput(this.userName, this.countryCode, this.mobileNumber,
      this.email, this.password, this.profilePicture);
}