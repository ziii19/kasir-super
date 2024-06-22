import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/settings/settings.dart';

import '../../../../core/core.dart';

part 'sections/item_section.dart';

class PrinterPage extends StatefulWidget {
  const PrinterPage({super.key});

  static const routeName = '/settings/printer';

  @override
  State<PrinterPage> createState() => _PrinterPageState();
}

class _PrinterPageState extends State<PrinterPage> {
  @override
  void initState() {
    context.read<PrinterBloc>().add(GetPrinterEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cari Printer'),
      ),
      body: BlocBuilder<PrinterBloc, PrinterState>(
        builder: (context, state) {
          return ListView.separated(
            padding: const EdgeInsets.all(Dimens.dp16),
            itemBuilder: (context, index) {
              final item = state.printers[index];
              return _ItemSection(
                onTap: () {
                  context
                      .read<PrinterBloc>()
                      .add(TestPrinterEvent(item.macAdress));
                },
                port: item.macAdress,
                title: item.name,
              );
            },
            separatorBuilder: (context, index) => Dimens.dp16.height,
            itemCount: state.printers.length,
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Dimens.dp16),
        child: ElevatedButton(
          onPressed: () {
            context.read<PrinterBloc>().add(OpenSettingsPrinterEvent());
          },
          child: const Text('Tambah Printer'),
        ),
      ),
    );
  }
}
