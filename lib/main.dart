import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/app/app.dart';
import 'package:kasir_super/core/helpers/crashlytics_helper.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://28505ffbabc15603509dd747e8dced5a@o4507512596267008.ingest.us.sentry.io/4507512609046528';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
    );

    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      CrashlyticsHelper.capture(error, stack);
      return true;
    };

    ConfigData.initialize();

    Bloc.observer = AppBlockObserver();
    runApp(const MainApp());
  }, (exception, stackTrace) async {
    log('''
      EXCEPTION : $exception
      STACK : $stackTrace
    ''');
    CrashlyticsHelper.capture(exception, stackTrace);
  });
}
