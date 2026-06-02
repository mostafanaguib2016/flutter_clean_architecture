import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput,Authentication> {

  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(LoginUseCaseInput input) async{
    return await _repository.login((LoginRequest(input.email,input.pasword)));
  }

}

class LoginUseCaseInput {
  String email;
  String pasword;

  LoginUseCaseInput(this.email, this.pasword);
}