import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasir_super/features/pos/pages/pages.dart';
import 'package:kasir_super/features/pos/pos.dart';
import 'package:kasir_super/features/product/models/model.dart';
import 'package:kasir_super/features/transaction/pages/detail/page.dart';

import '../core/components/components.dart';
import '../features/home/home.dart';
import '../features/product/pages/pages.dart';
import '../features/settings/pages/pages.dart';

Route<dynamic> router(settings) {
  switch (settings.name) {
    case MainPage.routeName:
      return MaterialPageRoute(builder: (context) {
        return const MainPage();
      });
    case ProductInputPage.routeName:
      return MaterialPageRoute(builder: (context) {
        return ProductInputPage(
          product: settings.arguments as ProductModel?,
        );
      });
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (context) {
        return const ProfilePage();
      });
    case XenditPage.routeName:
      return MaterialPageRoute(builder: (context) {
        return const XenditPage();
      });
    case StruckPage.routeName:
      return MaterialPageRoute(builder: (context) {
        return const StruckPage();
      });
    case ShowStruckPage.routeName:
      return MaterialPageRoute(builder: (context) {
        return const ShowStruckPage();
      });
    case PrinterPage.routeName:
      return MaterialPageRoute(builder: (context) {
        return const PrinterPage();
      });
    case POSOrderPage.routeName:
      return CupertinoPageRoute(builder: (context) {
        return const POSOrderPage();
      });
    case PaymentPage.routeName:
      return CupertinoPageRoute(builder: (context) {
        return PaymentPage(referenceId: settings.arguments as String?);
      });
    case CashPage.routeName:
      return CupertinoPageRoute(builder: (context) {
        return CashPage(referenceId: settings.arguments as String?,);
      });
    case SuccessTransactionPage.routeName:
      return CupertinoPageRoute(builder: (context) {
        return SuccessTransactionPage(
          referenceId: settings.arguments as String?,
        );
      });
    case POSQrPage.routeName:
      return CupertinoPageRoute(builder: (context) {
        return const POSQrPage();
      });
    case TransactionDetailPage.routeName:
      return CupertinoPageRoute(builder: (context) {
        return TransactionDetailPage(
          referenceId: settings.arguments as String,
        );
      });
    default:
      return MaterialPageRoute(builder: (context) {
        return const Scaffold(
          body: Center(
            child: RegularText(
              'Page Not Found!',
              textAlign: TextAlign.center,
            ),
          ),
        );
      });
  }
}
