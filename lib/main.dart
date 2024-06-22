import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/app/app.dart';

import 'core/core.dart';

void main() {
  Bloc.observer = AppBlockObserver();
  runApp(const MainApp());
}
