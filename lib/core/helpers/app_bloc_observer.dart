import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/helpers/crashlytics_helper.dart';

class AppBlockObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('$change', name: 'BLOC');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    CrashlyticsHelper.capture(error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}
