abstract class BaseApiServices {
  Future<dynamic> getGetApiServices(String url);
  Future<dynamic> getPostApiServices(String url,dynamic data);
  Future<dynamic> getPutApiServices(String url, dynamic data);
  Future<dynamic> getDeleteApiServices(String url,dynamic data);
}
