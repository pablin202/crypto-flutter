import 'package:bloc/bloc.dart';
import 'package:crypto_app/src/coins/domain/models/coin.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1day_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_coin_by_id.dart';
import 'package:crypto_app/src/coins/domain/usecases/params/get_history_params.dart';
import 'package:equatable/equatable.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({required Get1DayHistory get1dayHistory})
      : _get1dayHistory = get1dayHistory,
        super(HistoryInitial());

  final Get1DayHistory _get1dayHistory;

  Future<void> getOnDayHistory(String id) async {
    emit(GettingHistory());
    final result = await _get1dayHistory(GetHistoryParams(id: id));

    result.fold((failure) => emit(HistoryError(failure.toString())), (history) {
      emit(HistoryLoaded(history));
    });
  }
}
