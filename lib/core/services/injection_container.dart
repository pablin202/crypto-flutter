import 'package:crypto_app/core/constants/api.dart';
import 'package:crypto_app/src/coins/data/datasources/coin_paprika_remo_datasource.dart';
import 'package:crypto_app/src/coins/data/repositories/coins_repository_impl.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_all_coins.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  //final prefs = await SharedPreferences.getInstance();

  sl
    ..registerFactory(
      () => ScoreCubit(
        getGames: sl(),
      ),
    )
    ..registerFactory(
      () => LeaguesCubit(
        getAllLeagues: sl(),
      ),
    )
    ..registerLazySingleton(() => GetAllCoins(sl()))
    ..registerLazySingleton<CoinsRepository>(() => CoinsRepositoryImpl(sl()))
    ..registerLazySingleton<CoinPaprikaRemoteDataSource>(
      () => CoinPaprikaRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => dio);
}
