import 'package:crypto_app/core/constants/api.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/datasource/coin_cap_remote_datasource.dart';
import 'package:crypto_app/src/coins/data/coin_cap_api/repositories/coins_repository_impl.dart';
import 'package:crypto_app/src/coins/data/coin_paprika_api/datasources/coin_paprika_remo_datasource.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_all_coins.dart';
import 'package:crypto_app/src/coins/presentation/coin_list/cubit/coin_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final dio = Dio(BaseOptions(baseUrl: baseUrlCoinCap));

  //final prefs = await SharedPreferences.getInstance();

  sl
    ..registerFactory(
      () => CoinsCubit(
        getAllCoins: sl(),
      ),
    )
    ..registerLazySingleton(() => GetAllCoins(sl()))
    ..registerLazySingleton<CoinsRepository>(() => CoinsRepositoryImpl(sl()))
    ..registerLazySingleton<CoinPaprikaRemoteDataSource>(
      () => CoinPaprikaRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<CoinCapRemoteDataSource>(
      () => CoinCapRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => dio);
}
