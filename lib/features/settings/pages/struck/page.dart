import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';
import 'package:kasir_super/features/settings/blocs/struck/struck_bloc.dart';
import 'package:kasir_super/features/settings/pages/show_struck/page.dart';

class StruckPage extends StatefulWidget {
  const StruckPage({super.key});

  static const routeName = '/settings/struck';

  @override
  State<StruckPage> createState() => _StruckPageState();
}

class _StruckPageState extends State<StruckPage> {
  TextEditingController descController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void initState() {
    context.read<StruckBloc>().add(GetStruckEvent());
    super.initState();
  }

  @override
  void dispose() {
    descController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<StruckBloc, StruckState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          descController.text = state.struck?.desc ?? '';
          messageController.text = state.struck?.message ?? '';
        }
        if (state.status == Status.success) {
          Navigator.pop(context);
        }
        if (state.status == Status.failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error ?? 'Something Wrong!')));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Atur Struk'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(Dimens.dp16),
          children: [
            RegularText.semiBold('Pengaturan Dasar'),
            Dimens.dp24.height,
            RegularTextInput(
              controller: descController,
              label: 'Keterangan',
              hintText: 'Cth: @kasirsuper',
            ),
            Dimens.dp24.height,
            RegularTextInput(
              controller: messageController,
              label: 'Pesan',
              hintText: 'Cth: Selamat menikmati',
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ShowStruckPage.routeName);
                  },
                  child: const Text('Lihat Tampilan Struck')),
              Dimens.dp16.height,
              ElevatedButton(
                onPressed: () {
                  context.read<StruckBloc>().add(SubmitStruckEvent(
                      desc: descController.text,
                      message: messageController.text));
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
