import 'package:mvvm_october/data/network/network_api_services.dart';
import 'package:mvvm_october/data/network/base_api_services.dart';
import 'package:mvvm_october/resource/app_url/app_url.dart';
import 'package:mvvm_october/utils/utils.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> login(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.login, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUp(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.signUp, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
