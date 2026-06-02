import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/mapper/mapper.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/network_info.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo,this._remoteDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      final response = await _remoteDataSource.login(loginRequest);
      if(response.status == 0){
        return Right(response.toDomain());
      }else{
        return Left(Failure(response.status ?? 422, response.message ?? "Something went wrong"));
      }
    }else{
      return Left(Failure(505, "Please check your internet connection!"));
    }
  }

} 