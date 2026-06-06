import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/usecase/base_usecase.dart';

class ForgetPasswordUseCase implements BaseUseCase<String,String> {

  final Repository _repository;
  ForgetPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, String>> execute(String input) async{
    return await _repository.forgetPassword((input));
  }

}
