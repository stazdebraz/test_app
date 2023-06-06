// Project imports:
import 'package:app_test/credits_data_module/data/model/credit_data_model.dart';
import 'credits_data_state.dart';

class CreditsDataSuccessState extends CreditsDataState{
  final Map<String,CreditDataModel> credits;
  CreditsDataSuccessState({required this.credits});
}
