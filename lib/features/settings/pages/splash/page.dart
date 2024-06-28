import 'package:flutter/material.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/settings/pages/pages.dart';

import '../../../../app/config.dart';
import '../../../home/pages/main/main.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkUpdate();
    super.initState();
  }

  Future<void> checkUpdate() async {
    final version = await ConfigData.checkUpdate();

    if (version == AppVersionType.upToDate) {
      mainNavigate();
    } else {
      updateNavigate(version);
    }
  }

  void mainNavigate() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainPage.routeName,
      (route) => false,
    );
  }

  void updateNavigate(AppVersionType appVersion) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      UpdatePage.routeName,
      (route) => false,
      arguments: appVersion,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              MainAssets.logo,
              width: Dimens.width(context) / 2,
            ),
            Dimens.defaultSize.height,
            HeadingText(
              AppConfig.appName,
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: Dimens.dp32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
