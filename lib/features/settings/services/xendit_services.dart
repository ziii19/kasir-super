import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class XenditServices {
  XenditServices._();

  static Future<String> insert(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('xendit', key);

      return key;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<String?> get() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final data = prefs.getString('xendit');

      if (data != null) {
        return data;
      }

      return null;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
