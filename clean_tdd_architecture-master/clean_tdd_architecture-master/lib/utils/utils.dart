import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Feature/data/endpoint/constants.dart';
enum UiDesignItems {
  table,
  card,
}


class Utils {
  static Future<http.Response> getApiCall(String url) {
    EndPoint.headers['token'] = EndPoint.user_token;
    return http.get(Uri.parse(url), headers: EndPoint.headers);
  }
  static Future<http.Response> postApiCall(String url, var body) {
    var dt = jsonEncode(body);

    EndPoint.headers['token'] = EndPoint.user_token;
    return http.post(Uri.parse(url), body: dt);
  }
// void showInSnackBar(
//     String message, GlobalKey<ScaffoldState> _scaffoldKey, bool isSuccess) {
//   _scaffoldKey.currentState!.showSnackBar(
//     SnackBar(
//       content: Text(
//         message,
//         style: TextStyle(color: isSuccess ? Colors.grey : Colors.red),
//       ),
//     ),
//   );
// }
}