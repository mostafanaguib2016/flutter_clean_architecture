import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';

abstract class Repository{
  Future<Either<Failure,Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure,Authentication>> register(RegisterRequest registerRequest);
  Future<Either<Failure,String>> forgetPassword(String email);
  Future<Either<Failure,HomeObject>> getHomeData();
  // receive
}