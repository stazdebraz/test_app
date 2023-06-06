// Package imports:

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:app_test/credits_data_module/data/model/credit_data_model.dart';
import 'package:app_test/credits_data_module/domain/usecases/get_credit_data_case.dart';
import 'package:app_test/credits_data_module/ui/bloc/credit_data_bloc/states/credits_data_error_state.dart';
import 'package:app_test/credits_data_module/ui/bloc/credit_data_bloc/states/credits_data_init_state.dart';
import 'package:app_test/credits_data_module/ui/bloc/credit_data_bloc/states/credits_data_loading_state.dart';
import 'package:app_test/credits_data_module/ui/bloc/credit_data_bloc/states/credits_data_state.dart';
import 'package:app_test/credits_data_module/ui/bloc/credit_data_bloc/states/credits_data_success_state.dart';
import 'events/credits_data_event.dart';
import 'events/get_credit_data_event.dart';

class CreditsDataBloc extends Bloc<CreditsDataEvent, CreditsDataState> {
  CreditsDataBloc({required this.usecase}) : super(CreditsDataInitState()) {
    on<GetCreditDataEvent>((event, emit) async {
      await loadCreditData(emit: emit, event: event);
    });
  }
  loadCreditData(
      {required Emitter emit, required GetCreditDataEvent event}) async {
    try {
      emit(CreditsDataLoadingState());
      final Map<String, CreditDataModel> data =
          await usecase.getData(index: event.index);
      emit(CreditsDataSuccessState(credits: data));
    } catch (e) {
      emit(CreditsDataErrorState(
        text: e.toString(),
      ));
    }
  }

  final GetCreditDataCase usecase;
}
