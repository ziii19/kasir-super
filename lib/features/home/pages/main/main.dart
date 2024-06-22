import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/home/blocs/blocs.dart';
import 'package:kasir_super/features/pos/pages/index/page.dart';
import 'package:kasir_super/features/product/pages/pages.dart';
import 'package:kasir_super/features/settings/pages/pages.dart';
import 'package:kasir_super/features/transaction/pages/pages.dart';

import '../../../../core/core.dart';
import 'home/page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    const pages = <Widget>[
      HomePage(),
      TransactionPage(),
      POSPage(),
      ProductPage(),
      SettingsPage(),
    ];

    return BlocBuilder<BottomNavBloc, int>(
      builder: (context, index) {
        return Scaffold(
          body: pages[index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              context.read<BottomNavBloc>().add(TapBottomNavEvent(value));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(AppIcons.storefront),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.receipt),
                label: 'Transaksi',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.pos),
                label: 'POS',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.product),
                label: 'Produk',
              ),
              BottomNavigationBarItem(
                icon: Icon(AppIcons.settings),
                label: 'Lainnya',
              ),
            ],
          ),
        );
      },
    );
  }
}
