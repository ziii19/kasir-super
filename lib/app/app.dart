import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/app/route.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/home/blocs/blocs.dart';
import 'package:kasir_super/features/product/blocs/blocs.dart';
import 'package:kasir_super/features/transaction/blocs/transaction/transaction_bloc.dart';

import '../features/pos/blocs/blocs.dart';
import '../features/settings/settings.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider(
            create: (context) => ProfileBloc()..add(GetProfileEvent())),
        BlocProvider(create: (context) => XenditBloc()..add(GetXenditEvent())),
        BlocProvider(create: (context) => StruckBloc()..add(GetStruckEvent())),
        BlocProvider(create: (context) => PrinterBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => FormProductBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => TransactionBloc()),
      ],
      child: MaterialApp(
        title: 'kasir SUPER',
        theme: LightTheme(AppColors.green).theme,
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
        onGenerateRoute: router,
      ),
    );
  }
}
