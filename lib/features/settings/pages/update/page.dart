import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../home/home.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key, required this.version});
  final AppVersionType version;

  static const routeName = '/update';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.asset(
                MainAssets.logo,
                width: 150,
              ),
              Dimens.dp40.height,
              SubtitleText(
                ('New update is available'),
                style: TextStyle(
                  color: context.theme.primaryColor,
                  fontSize: Dimens.dp22,
                ),
              ),
              Dimens.dp16.height,
              RegularText(
                'The current version of this application is no longer supported. We apologize for any inconvenience we may have caused your',
                textAlign: TextAlign.center,
                style: TextStyle(color: context.theme.disabledColor),
              ),
              Dimens.dp24.height,
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        LauncherHelper.launch('https://play.google.com/');
                      },
                      child: const Text('Update Now')),
                  Dimens.dp8.height,
                  if (version == AppVersionType.haveUpdate) ...[
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            MainPage.routeName,
                            (route) => false,
                          );
                        },
                        child: const Text('Update Later')),
                  ],
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
