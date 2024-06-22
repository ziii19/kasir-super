import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kasir_super/features/settings/models/struck_model.dart';
import 'package:kasir_super/features/settings/services/services.dart';

import '../../../../core/core.dart';

part 'struck_event.dart';
part 'struck_state.dart';

class StruckBloc extends Bloc<StruckEvent, StruckState> {
  StruckBloc() : super(StruckState.initial()) {
    on<GetStruckEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await StruckServices.get();

        emit(state.copyWith(status: Status.apply, struck: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
    on<SubmitStruckEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));

        final service = await StruckServices.insert(
            StruckModel(desc: event.desc, message: event.message));

        emit(state.copyWith(status: Status.success, struck: service));
      } catch (e) {
        emit(state.copyWith(status: Status.failure, error: e.toString()));
      }
    });
  }
}
