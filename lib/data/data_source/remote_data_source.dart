import 'package:flutter_clean_architecture/data/network/app_api.dart';
import 'package:flutter_clean_architecture/data/network/requests.dart';
import 'package:flutter_clean_architecture/data/responses/base_response.dart';

abstract class RemoteDataSource {

  Future<AuthResponse> login(LoginRequest loginRequest);
  Future<AuthResponse> register(RegisterRequest registerRequest);
  Future<ForgotPasswordResponse> forgetPassword(String email);
  Future<HomeResponse> home();
  Future<StoreDetailsResponse> getStoreDetails();
}

class RemoteDataSourceImpl implements RemoteDataSource {

  final AppServiceClient _appServiceClient;


  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async{
    return await _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async{
    return await _appServiceClient.register(
      registerRequest.userName,
      registerRequest.countryCode,
      registerRequest.mobileNumber,
      registerRequest.email,
      registerRequest.password,
      registerRequest.profilePicture
    );
  }

  @override
  Future<ForgotPasswordResponse> forgetPassword(String email) async{
    return await _appServiceClient.forgotPassword(email);
  }

  @override
  Future<HomeResponse> home() async{
    return await _appServiceClient.home();
  }

  @override
  Future<StoreDetailsResponse> getStoreDetails() async{
    return await _appServiceClient.getStoreDetails();

  }

}