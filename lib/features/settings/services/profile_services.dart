import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kasir_super/features/settings/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileServices {
  ProfileServices._();

  static Future<UserModel> insertProfile(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('profile', jsonEncode(user.toJson()));

      return user;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<UserModel?> getProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final data = prefs.getString('profile');

      if (data != null) {
        return UserModel.fromJson(jsonDecode(data));
      }

      return null;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
