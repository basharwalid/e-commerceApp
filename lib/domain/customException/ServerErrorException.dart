class ServerErrorException implements Exception{
  String? statusMsg;
  String? errormessage;
  int? httpResponseCode;
  ServerErrorException({this.errormessage , this.statusMsg , this.httpResponseCode});
}