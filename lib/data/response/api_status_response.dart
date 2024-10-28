import 'package:mvvm_october/data/response/status.dart';

class ApiStatusResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiStatusResponse({this.status, this.data, this.message});
  ApiStatusResponse.loading() : status = Status.LOADING;
  ApiStatusResponse.completed(this.data) : status = Status.COMPLETED;
  ApiStatusResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status \n $status \n Data \n $data \n Message \n $message  ';
  }
}
