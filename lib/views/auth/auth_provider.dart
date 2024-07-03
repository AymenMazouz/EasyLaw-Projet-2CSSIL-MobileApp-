import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:qanoun_sahl/models/user.dart';
import 'package:qanoun_sahl/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  Future<User?> login({required String email, required String password}) async {
    return await AuthService.login(email: email, password: password);
  }

  Future<User?> register({
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    log("Hello");
    return await AuthService.register(
        email: email,
        firstName: firstName,
        lastName: lastName,
        password: password);
  }

  Future<User?> getUser({
    required int? userId,
    required String? token,
  }) async {
    return await AuthService.getUser(userId: userId, token: token);
  }
}
