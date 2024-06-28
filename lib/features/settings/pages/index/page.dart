import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/settings/blocs/blocs.dart';
import 'package:kasir_super/features/settings/pages/pages.dart';

import '../../../../app/config.dart';
import '../../../../core/core.dart';
import '../../components/components.dart';

part 'sections/profile_section.dart';
part 'sections/account_section.dart';
part 'sections/other_section.dart';
part 'sections/device_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lainnya'),
      ),
      body: ListView(
        children: [
          const _ProfileSection(),
          const Divider(thickness: Dimens.dp8),
          const _AccountSection(),
          const Divider(thickness: Dimens.dp8),
          const _DeviceSection(),
          const Divider(thickness: Dimens.dp8),
          const _OtherSection(),
          Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: context.theme.colorScheme.error,
                side: BorderSide(color: context.theme.colorScheme.error),
              ),
              onPressed: () {},
              child: const Text('Keluar'),
            ),
          ),
        ],
      ),
    );
  }
}
