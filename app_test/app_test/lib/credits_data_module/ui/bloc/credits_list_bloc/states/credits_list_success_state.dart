// Project imports:
import 'package:app_test/credits_data_module/data/model/credit_list_model.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/states/credits_list_state.dart';

class CreditsListSuccessState extends CreditsListState {
  CreditsListSuccessState({required this.model});
  final CreditsListModel model;
}
