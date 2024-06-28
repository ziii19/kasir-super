import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../core.dart';

class ConfigData {
  ConfigData._();

  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    try {
      await remoteConfig.setDefaults(const {
        'appName': 'Kasir SUPER',
        'maxVersion': 1,
        'minVersion': 1,
        'xenditKey':
            'xnd_development_3QbjQOEbxbPv78ssf17Keon6VemRCk1IyhtQiKXo2bNNfGfVW6u2vdlh0tv0Sla:',
      });

      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 30),
        minimumFetchInterval: const Duration(minutes: 1),
      ));

      await remoteConfig.fetchAndActivate();
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static String getValue(String key) {
    return remoteConfig.getValue(key).asString();
  }

  static Future<AppVersionType> checkUpdate() async {
    try {
      final maxVersion = remoteConfig.getInt('maxVersion');
      final minVersion = remoteConfig.getInt('minVersion');

      final packageInfo = await PackageInfo.fromPlatform();

      final nowVersion = int.parse(packageInfo.buildNumber);

      log('''
        NOW VERSION : $nowVersion
        MIN VERSION : $minVersion
        MAX VERSION : $maxVersion
      ''', name: 'VERSION APP');

      if (nowVersion < minVersion) {
        return AppVersionType.expired;
      } else if (nowVersion < maxVersion) {
        return AppVersionType.haveUpdate;
      } else {
        return AppVersionType.upToDate;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
