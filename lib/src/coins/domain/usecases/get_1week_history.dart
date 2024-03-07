import 'package:crypto_app/core/usecases/usecases.dart';
import 'package:crypto_app/core/utils/typedefs.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';
import 'package:crypto_app/src/coins/domain/models/period.dart';
import 'package:crypto_app/src/coins/domain/repositories/coins_repository.dart';
import 'package:crypto_app/src/coins/domain/usecases/params/get_history_params.dart';

import '../models/intervals.dart';

class Get1WeekHistory
    extends UseCaseWithParams<List<History>, GetHistoryParams> {
  const Get1WeekHistory(this._repo);

  final CoinsRepository _repo;

  @override
  ResultFuture<List<History>> call(GetHistoryParams params) {
    var period = Period.oneWeek();
    return _repo.getHistoryById(
        params.id, Interval.m30.name, period.start, period.end);
  }
}
