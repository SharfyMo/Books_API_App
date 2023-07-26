import 'package:dio/dio.dart';

class ApiService {
  final baseApi = 'https://www.googleapis.com/books/v1/';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$baseApi$endPoint');
    return response.data;
  }
}
