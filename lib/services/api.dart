import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  static const Map<String, String> _authheader = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
    'X-CSRFToken':
        'oI6fzxQE5WEGGIvLAVSs4V38r6k1DkfdZ0OGcWdrzXRf1vxAxrBfdGzkPc5dq8oE'
  };
  // ignore: body_might_complete_normally_nullable
  static Future<Response?> post(
      {required String endPoint,
      Map<String, dynamic>? body,
      required String accessToken,
      bool isAuth = false}) async {
    final response = await http.post(Uri.parse(endPoint),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $accessToken",
        },
        body: jsonEncode(body));

    if (response.body.isNotEmpty) {
      final jsonData = jsonDecode(response.body);
    }

    return response;
  }

  static Future<Response?> get(
      {required String endPoint,
      required String accessToken,
      bool isAuth = false}) async {
    log(endPoint);

    final response = await http.get(Uri.parse(endPoint), headers: {
      'Authorization': "Bearer $accessToken",
    });

    // if (response.statusCode == 200) {
    //   return response;
    // }
    return response;
  }

  static Future<Response?> put(
      {required String endPoint,
      Map<String, dynamic>? body,
      required String accessToken,
      bool isAuth = false}) async {
    final response = await http.put(Uri.parse(endPoint),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': "Bearer $accessToken",
        },
        body: jsonEncode(body));

    log(endPoint.toString());
    log(jsonEncode(body).toString());
    if (response.body.isNotEmpty) {
      final jsonData = jsonDecode(response.body);
      print(jsonData);
    }

    return response;
  }
}
