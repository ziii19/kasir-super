import 'package:firebase_remote_config/firebase_remote_config.dart';

class ConfigData {
  ConfigData._();

  static final remoteConfig = FirebaseRemoteConfig.instance;

  static Future<void> initialize() async {
    try {
      await remoteConfig.setDefaults(const {
        "appName": 'Kasir SUPER',
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
}
