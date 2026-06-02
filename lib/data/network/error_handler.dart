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
  NO_INTERNET_CONNECTION
}

class ResponseCode{
  static const int Success = 200;
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
}

class ResponseMessage{
  static const String Success = "success";
  static const String NO_CONTENT = "success";
  static const String BAD_REQUEST = "Bad request, Try again later";
  static const String FORBIDDEN = "Forbidden request, Try again later";
  static const String UNAUTHORIZED = "unauthorized, Try again later";
  static const String NOT_FOUND = "Not found request";
  static const String INTERNAL_SERVER_ERROR = "Something went wrong, Try again later";
  static const String CONNECTION_TIMEOUT = "Time out error, Try again later";
  static const String RECEIVE_TIMEOUT = "Request was cancelled";
  static const String SEND_TIMEOUT = "Time out error, Try again later";
  static const String CACHE_ERROR = "Cache error, Try again later";
  static const String CANCEL = "Request was cancelled, Try again later";
  static const String NO_INTERNET_CONNECTION = "Please check your internet connection";
  static const String UNKOWN = "Something went wrong";
}