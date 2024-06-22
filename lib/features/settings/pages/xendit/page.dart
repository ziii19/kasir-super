import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/core/core.dart';

import '../../blocs/blocs.dart';

class XenditPage extends StatefulWidget {
  const XenditPage({super.key});

  static const routeName = '/settings/xendit';

  @override
  State<XenditPage> createState() => _XenditPageState();
}

class _XenditPageState extends State<XenditPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<XenditBloc>().add(GetXenditEvent());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<XenditBloc, XenditState>(
      listener: (context, state) {
        if (state.status == Status.apply) {
          controller.text = state.key;
        }
        if (state.status == Status.success) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('API Key Xendit'),
          ),
          body: ListView(
            padding: const EdgeInsets.all(Dimens.dp16),
            children: [
              RegularTextInput(
                  label: 'API Key',
                  controller: controller,
                  required: true,
                  hintText: 'API Key Xendit')
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(Dimens.dp16),
            child: ElevatedButton(
              onPressed: state.key.isNotEmpty
                  ? () {
                      context
                          .read<XenditBloc>()
                          .add(SubmitXenditEvent(controller.text));
                    }
                  : null,
              child: const Text('Simpan'),
            ),
          ),
        );
      },
    );
  }
}
