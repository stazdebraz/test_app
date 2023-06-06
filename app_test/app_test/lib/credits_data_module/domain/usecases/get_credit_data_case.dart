// Project imports:
import 'package:app_test/credits_data_module/data/data_source/network/credit_data_repo_imp.dart';
import 'package:app_test/credits_data_module/data/model/credit_data_model.dart';
import 'package:app_test/credits_data_module/domain/usecases/credit_usecase.dart';

class GetCreditDataCase extends CreditUseCase{
  final CreditDataRepoImp repo;
  GetCreditDataCase({required this.repo});
  Map<String, CreditDataModel> credits = {};
  getData({required int index}) async {
    if (credits.containsKey('$index')) {
    } else {
      final CreditDataModel data = await repo.getCreditData();
      credits.addAll({'$index': data});
    }
    return credits;
  }
}
