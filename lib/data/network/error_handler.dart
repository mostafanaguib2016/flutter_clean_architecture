import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/network/failure.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handleError(dynamic error){
    if(error is DioError){
      failure = _handleError(error);
    }else{
      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error){
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.badResponse:
        if (error.response != null &&
            error.response?.statusCode != null &&
            error.response?.statusMessage != null) {
          return Failure(error.response?.statusCode ?? 0,
              error.response?.statusMessage ?? "");
        } else {
          return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.unknown:
        return DataSource.DEFAULT.getFailure();
      case DioExceptionType.badCertificate:
        return DataSource.INTERNAL_SERVER_ERROR.getFailure();
      case DioExceptionType.connectionError:
        return DataSource.CONNECTION_TIMEOUT.getFailure();
    }
  }

}

enum DataSource{
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORIZED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECTION_TIMEOUT,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CANCEL,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT,
}

extension DataSourceExtension on DataSource{

  Failure getFailure(){
    switch(this){
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORIZED:
        return Failure(ResponseCode.UNAUTHORIZED, ResponseMessage.UNAUTHORIZED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECTION_TIMEOUT:
        return Failure(
            ResponseCode.CONNECTION_TIMEOUT, ResponseMessage.CONNECTION_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return Failure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return Failure(ResponseCode.DEFAULT,
            ResponseMessage.DEFAULT);
    }
  }

}

class ResponseCode{
  static const int SUCCESS = 200;
  static const int NO_CONTENT = 201;
  static const int BAD_REQUEST = 400;
  static const int FORBIDDEN = 503;
  static const int UNAUTHORIZED = 401;
  static const int NOT_FOUND = 404;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int CONNECTION_TIMEOUT = -1;
  static const int RECEIVE_TIMEOUT = -2;
  static const int SEND_TIMEOUT = -3;
  static const int CACHE_ERROR = -4;
  static const int CANCEL = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int UNKOWN = -7;
  static const int DEFAULT = -8;
}

class ResponseMessage{
  static const String SUCCESS = AppStrings.success;
  static const String NO_CONTENT = AppStrings.success;
  static const String BAD_REQUEST = AppStrings.badRequestError;
  static const String FORBIDDEN = AppStrings.forbiddenError;
  static const String UNAUTHORIZED = AppStrings.unauthorizedError;
  static const String NOT_FOUND = AppStrings.notFoundError;
  static const String INTERNAL_SERVER_ERROR = AppStrings.internalServerError;
  static const String CONNECTION_TIMEOUT = AppStrings.timeoutError;
  static const String RECEIVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String CANCEL = AppStrings.cancelError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String UNKOWN = AppStrings.defaultError;
  static const String DEFAULT = AppStrings.defaultError;
}

class ApiInternalStatus{
  static const int SUCCESS = 0;
  static const int Failure = 1;

}