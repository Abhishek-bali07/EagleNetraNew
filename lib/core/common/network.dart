
class RestResponse<T> {
  bool success;
  dynamic error;
  T? data;

  RestResponse(
      {required this.success, required this.error, required this.data});
}


abstract class Network{

}