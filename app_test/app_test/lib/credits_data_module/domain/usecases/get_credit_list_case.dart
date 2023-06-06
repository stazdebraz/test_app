// Project imports:
import 'package:app_test/credits_data_module/data/data_source/locale/credits_list_repo_imp.dart';
import 'package:app_test/credits_data_module/domain/usecases/credit_usecase.dart';
import '../../data/model/credit_list_model.dart';

class GetCreditsListCase extends CreditUseCase{
  GetCreditsListCase({required this.repo});
  final CreditsListRepoImp repo;
  getCreditsList() async{
    final CreditsListModel model = await repo.getCreditsList();
    return model;
  }
}
