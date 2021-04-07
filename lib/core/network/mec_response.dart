
class MECResponseCode {
  //[START]Server error
  static const int SUCCESS = 0;
  static const int API_TOKEN_EXPIRED = 6;
  static const int REFRESH_TOKEN_EXPIRED = 9;
  static const int SYSTEM_ERROR = 10;
//[START]Server error
}

class MECResponse<T> {
  int code;
  String message;
  T data;

  MECResponse({this.code, this.message, this.data});
}