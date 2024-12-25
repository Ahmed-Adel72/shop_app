import 'package:dio/dio.dart';

class ApiServiceStripe {
  final Dio dio;

  ApiServiceStripe(this.dio);

  Future<Response> post(
      {required body,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': 'Bearer $token'},
        ));
    return response;
  }
}
