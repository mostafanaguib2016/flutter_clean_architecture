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

  @POST("/customer/register")
  Future<AuthResponse> register(
      @Field("user_name") String userName,
      @Field("country_code") String countryCode,
      @Field("mobile_number") String mobileNumber,
      @Field("email") String email,
      @Field("password") String password,
      @Field("profile_picture") String profilePicture,
      );

  @POST("/customer/forgotPassword")
  Future<ForgotPasswordResponse> forgotPassword(@Field("email") String email);

  @GET("/home")
  Future<HomeResponse> home();

  @GET("/storeDetails/1")
  Future<StoreDetailsResponse> getStoreDetails();

}