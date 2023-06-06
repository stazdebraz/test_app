// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_test/credits_data_module/data/model/credit_list_model.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/events/credits_list_event.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/events/get_credits_list_event.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/states/credits_list_init_state.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/states/credits_list_state.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/states/credits_list_success_state.dart';
import '../../../domain/usecases/get_credit_list_case.dart';

class CreditsListBloc extends Bloc<CreditsListEvent, CreditsListState> {
  CreditsListBloc({required this.usecase}) : super(CreditsListInitState()) {
    on<GetCreditsListEvent>((event, emit) {
      _getCreditsList(emit: emit,event: event);
    });
  }
  _getCreditsList(
      {required Emitter emit, required GetCreditsListEvent event}) async {
    final CreditsListModel data = await usecase.getCreditsList();
    emit(CreditsListSuccessState(model: data));
  }

  final GetCreditsListCase usecase;
}
