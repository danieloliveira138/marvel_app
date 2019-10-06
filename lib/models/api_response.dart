class ServerResponse<T> {
  bool status;
  int statusCode;
  T result;
  
  ServerResponse (this.status, this.statusCode, this.result);

}