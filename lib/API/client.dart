import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class clientAuth {
  clientAuth();

  final String baseUrl = "https://cm.sitearound.com/api/o/token/";

  Future<http.Response> post(dynamic data) async {
    return await http.post(baseUrl,
        headers: <String, String>{
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: data);
  }
}

class CustomClient {
  CustomClient();

  final String baseUrl = "https://cm.sitearound.com/api/v1";
  final String baseUrlImage =
      'https://cm.sitearound.com/api/v1/static-file/?path=';

  Future<http.Response> get(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token');
    return await http.get(baseUrl + url, headers: <String, String>{
      'Authorization': 'Bearer $accessToken',
    });
  }

  Future<http.Response> getImage(String path) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token');
    print('urlImage:$baseUrlImage$path');
    print(accessToken);
    return await http.get(baseUrlImage + path, headers: <String, String>{
      'Authorization': 'Bearer $accessToken',
    });
  }

  Future<http.Response> post(String url, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token');
    return await http.post(baseUrl + url,
        headers: <String, String>{'Authorization': 'Bearer $accessToken'},
        body: data);
  }

  Future<http.Response> put(String url, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token');
    return await http.put(baseUrl + url,
        headers: <String, String>{'Authorization': 'Bearer $accessToken'},
        body: data);
  }

  Future<http.Response> patch(String url, dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token');
    return await http.patch(baseUrl + url,
        headers: <String, String>{'Authorization': 'Bearer $accessToken'},
        body: data);
  }

  Future<http.Response> delete(String url) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String accessToken = prefs.getString('access_token');
    return await http.delete(baseUrl + url,
        headers: <String, String>{'Authorization': 'Bearer $accessToken'});
  }
  // Email & Password Sign In

  // Sign Out

}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email can't be empty";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    return null;
  }
}
