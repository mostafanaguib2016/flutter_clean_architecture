import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/app/constants.dart';
import 'package:flutter_clean_architecture/data/responses/base_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient{
  factory AppServiceClient(Dio dio,{String baseUrl}) = _AppServiceClient;

  @POST("/customer/login")
  Future<AuthResponse> login(
      @Field("email") String email,
      @Field("password") String password,
      );

  @POST("/customer/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

}