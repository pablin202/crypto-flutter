import 'package:crypto_app/core/constants/api.dart';
import 'package:crypto_app/core/utils/logger_interceptor.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/datasource/coin_cap_remote_datasource.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/repositories/coins_repository_impl.dart';
import 'package:crypto_app/src/coins/data/coin_paprika_api/datasources/coin_paprika_remo_datasource.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1day_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1month_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1week_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1year_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_6months_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_all_coins.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_coin_by_id.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/cubit/coin_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_details/cubit/history_cubit.dart';
import 'package:crypto_app/src/coins/presentation/coin_list/cubit/coins_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final dio = Dio(BaseOptions(baseUrl: baseUrlCoinCap))
    ..interceptors.addAll([
      LoggerInterceptor(), //custom logger interceptor.
    ]);

  //final prefs = await SharedPreferences.getInstance();

  sl
    ..registerFactory(
      () => CoinsCubit(
        getAllCoins: sl(),
      ),
    )
    ..registerFactory(
      () => CoinCubit(getCoinById: sl()),
    )
    ..registerFactory(
      () => HistoryCubit(
          get1dayHistory: sl(),
          get1weekHistory: sl(),
          get1monthHistory: sl(),
          get6monthsHistory: sl(),
          get1yearHistory: sl()),
    )
    ..registerLazySingleton(() => GetCoinById(sl()))
    ..registerLazySingleton(() => GetAllCoins(sl()))
    ..registerLazySingleton(() => Get1DayHistory(sl()))
    ..registerLazySingleton(() => Get1WeekHistory(sl()))
    ..registerLazySingleton(() => Get1MonthHistory(sl()))
    ..registerLazySingleton(() => Get6MonthsHistory(sl()))
    ..registerLazySingleton(() => Get1YearHistory(sl()))
    ..registerLazySingleton<CoinsRepository>(() => CoinsRepositoryImpl(sl()))
    ..registerLazySingleton<CoinPaprikaRemoteDataSource>(
      () => CoinPaprikaRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CoinCapRemoteDataSource>(
      () => CoinCapRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => dio);
}
