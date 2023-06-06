// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:app_test/core/services/dio_settings.dart';
import 'package:app_test/credits_data_module/data/data_source/network/credit_data_repo_imp.dart';
import 'package:app_test/credits_data_module/domain/usecases/get_credit_data_case.dart';
import 'package:app_test/credits_data_module/ui/bloc/credits_list_bloc/credits_list_bloc.dart';
import '../../credits_data_module/data/data_source/locale/credits_list_repo_imp.dart';
import '../../credits_data_module/domain/usecases/get_credit_list_case.dart';
import '../../credits_data_module/ui/bloc/credit_data_bloc/credits_data_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<DioSettings>(() => DioSettings());
  sl.registerLazySingleton<CreditDataRepoImp>(
      () => CreditDataRepoImp(dio: sl<DioSettings>().dio));
  sl.registerLazySingleton<GetCreditDataCase>(
      () => GetCreditDataCase(repo: sl<CreditDataRepoImp>()));
  sl.registerLazySingleton<CreditsDataBloc>(
      () => CreditsDataBloc(usecase: sl()));
  sl.registerLazySingleton<CreditsListRepoImp>(() => CreditsListRepoImp());
  sl.registerLazySingleton<GetCreditsListCase>(
      () => GetCreditsListCase(repo: sl<CreditsListRepoImp>()));
  sl.registerLazySingleton<CreditsListBloc>(
      () => CreditsListBloc(usecase: sl<GetCreditsListCase>()));
}
