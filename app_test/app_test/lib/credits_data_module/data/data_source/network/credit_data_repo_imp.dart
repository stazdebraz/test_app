// Package imports:
import 'package:dio/dio.dart';

// Project imports:
import 'package:app_test/credits_data_module/domain/repo/credit_data_repo.dart';
import '../../model/credit_data_model.dart';

class CreditDataRepoImp implements CreditDataRepo{
  CreditDataRepoImp({required this.dio});
  final Dio dio;
  @override
  getCreditData() async{
    final response = await dio.get('test_task');
    final CreditDataModel model = CreditDataModel.fromJson(response.data);
    return model;
  }

}
