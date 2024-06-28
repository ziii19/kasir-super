import 'package:flutter/material.dart';
import 'package:kasir_super/app/config.dart';
import 'package:kasir_super/core/core.dart';

part 'sections/heading.dart';
part 'sections/type_section.dart';
part 'sections/order_section.dart';
part 'sections/detail_section.dart';

class ShowStruckPage extends StatelessWidget {
  const ShowStruckPage({super.key});

  static const routeName = '/settings/struck/show';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tampilan Struck'),
      ),
      body: ListView(
        children: [
          const _HeadingSection(),
          const Divider(thickness: 8),
          const _TypeSection(),
          const Divider(thickness: 8),
          const _OrderSection(),
          const Divider(thickness: 8),
          const _DetailSection(),
          Dimens.dp24.height,
        ],
      ),
    );
  }
}
