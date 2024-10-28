import 'dart:convert';
import 'dart:io';

import 'package:mvvm_october/data/network/app_exceptions.dart';
import 'package:mvvm_october/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  @override
  Future getGetApiServices(String url) async {
    dynamic responseJson;
    try {
      dynamic response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getDeleteApiServices(String url, data) {
    // TODO: implement getDeleteApiServices
    throw UnimplementedError();
  }

  @override
  Future getPostApiServices(String url, data) async {
    dynamic responseJson;
    try {
      dynamic response = await http.post(Uri.parse(url), body: data);
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future getPutApiServices(String url, data) {
    // TODO: implement getPutApiServices
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200 || 201:
        dynamic responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 401:
        throw BadRequestException(response.body.toString());

      case 403:
        throw UnAuthorisedException(response.body.toString());
      case 500:
        throw FetchDataException(response.body.toString());
      default:
    }
  }
}
