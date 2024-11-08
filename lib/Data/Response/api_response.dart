import 'package:mvvm/Data/Response/status.dart';

class ApiResponse<T> {
  T? data;
  String? message;
  Status? status;

  ApiResponse(this.data, this.message, this.status);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed() : status = Status.COMPLETED;

  ApiResponse.error() : status = Status.ERROR;

  @override
  String toString(){

    return 'ApiResponse{data: $data, message: $message, status: $status}';

  }
}
