import 'package:flutter_clean_architecture/data/network/app_api.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/data/responses/base_response.dart';

abstract class RemoteDataSource {

  Future<AuthResponse> login(LoginRequest loginRequest);

}

class RemoteDataSourceImpl implements RemoteDataSource {

  AppServiceClient _appServiceClient;


  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

}