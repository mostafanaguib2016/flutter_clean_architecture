import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/data/data_source/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/local_data_source/local_data_source.dart';
import 'package:flutter_clean_architecture/data/mapper/mapper.dart';
import 'package:flutter_clean_architecture/data/network/error_handler.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/data/network/network_info.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';

class RepositoryImpl implements Repository {

  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._networkInfo,this._remoteDataSource,this._localDataSource);

  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest) async{
    if(await _networkInfo.isConnected){
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if(response.status == ApiInternalStatus.SUCCESS){
          return Right(response.toDomain());
        }else{
          return Left(Failure(ApiInternalStatus.Failure, response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (e) {
        return Left(ErrorHandler.handleError(e).failure);
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async{
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call API
        final response = await _remoteDataSource.forgetPassword(email);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return right
          return Right(response.toDomain());
        } else {
          // failure
          // return left
          return Left(Failure(response.status ?? ResponseCode.DEFAULT,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler
            .handleError(error)
            .failure);
      }
    } else {
      // return network connection error
      // return left
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest) async{
    if(await _networkInfo.isConnected){
      try {
        final response = await _remoteDataSource.register(registerRequest);
        if(response.status == ApiInternalStatus.SUCCESS){
          return Right(response.toDomain());
        }else{
          return Left(Failure(ApiInternalStatus.Failure, response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (e) {
        return Left(ErrorHandler.handleError(e).failure);
      }
    }else{
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> getHomeData() async{

    try{
      final response = await _localDataSource.getHomeData();
      return Right(response.toDomain());

    }catch(cacheError){
      // cache isn't valid
      debugPrint("CACHE ERROR --> ${cacheError} ${cacheError}");

      if(await _networkInfo.isConnected){
        try {
          final response = await _remoteDataSource.home();
          if(response.status == ApiInternalStatus.SUCCESS){
            // saving cache
            _localDataSource.saveHomeDataIntoCache(response);
            return Right(response.toDomain());
          }else{
            return Left(Failure(ApiInternalStatus.Failure, response.message ?? ResponseMessage.DEFAULT));
          }
        } catch (e) {
          return Left(ErrorHandler.handleError(e).failure);
        }
      }else{
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }


  }

  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async{
    try{
      final response = await _localDataSource.getStoreDetails();
      return Right(response.toDomain());
    }catch(cacheError){
      if(await _networkInfo.isConnected){
        try {
          final response = await _remoteDataSource.getStoreDetails();
          if(response.status == ApiInternalStatus.SUCCESS){
            _localDataSource.saveStoreDetailsToCache(response);
            return Right(response.toDomain());
          }else{
            return Left(Failure(ApiInternalStatus.Failure, response.message ?? ResponseMessage.DEFAULT));
          }
        } catch (e) {
          return Left(ErrorHandler.handleError(e).failure);
        }
      }else{
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }

}