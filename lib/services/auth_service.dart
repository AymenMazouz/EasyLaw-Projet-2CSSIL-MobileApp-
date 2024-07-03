import 'dart:convert';
import 'dart:developer';
import 'package:qanoun_sahl/consts.dart';
import 'package:qanoun_sahl/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:qanoun_sahl/services/local_storage_service.dart';

class AuthService {
  static Future<User?> login(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse("$BASE_URL/auth/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {"email": email, "password": password},
        ),
      );

      log(response.body);

      switch (response.statusCode) {
        case 200:
          final responseBody = jsonDecode(response.body);
          LocalStorageService.setAuthToken(responseBody["token"]);
          LocalStorageService.setUserId(responseBody["userId"]);
          User? user = await getUser(
            userId: responseBody["userId"],
            token: responseBody["token"],
          );
          return user;
        default:
          break;
      }
    } catch (e) {}
    return null;
  }

  static Future<User?> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      log("HII");
      final response = await http.post(
        Uri.parse("$BASE_URL/auth/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "email": email,
            "firstname": firstName,
            "lastname": lastName,
            "password": password
          },
        ),
      );
      log(response.body);

      switch (response.statusCode) {
        case 201:
          return await login(email: email, password: password);
        default:
          break;
      }
    } catch (e) {}
    return null;
  }

  static Future<bool> logout() async {
    try {
      final response = await http.post(
        Uri.parse("$BASE_URL/auth/logout"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      log(response.body);

      switch (response.statusCode) {
        case 200:
          return true;
        default:
          break;
      }
    } catch (e) {}
    return false;
  }

  static Future<User?> getUser({
    required int? userId,
    required String? token,
  }) async {
    try {
      // if (token == null) return null;

      final response = await http.get(
        Uri.parse("$BASE_URL/users/$userId"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );
      log(response.body);

      switch (response.statusCode) {
        case 200:
          final responseBody = jsonDecode(response.body);
          User user = User.fromJson(jsonEncode(responseBody));
          return user;
        default:
          break;
      }
    } catch (e) {}
    return null;
  }
}
