import '../core/core.dart';

class AppConfig {
  AppConfig._();

  static final String appName = ConfigData.getValue('appName');

  static final String xenditKey = ConfigData.getValue('xenditKey');
}
