import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kasir_super/features/settings/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StruckServices {
  StruckServices._();

  static Future<StruckModel> insert(StruckModel struck) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('struck', jsonEncode(struck.toJson()));

      return struck;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  static Future<StruckModel?> get() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      final data = prefs.getString('struck');

      if (data != null) {
        return StruckModel.fromJson(jsonDecode(data));
      }

      return null;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
