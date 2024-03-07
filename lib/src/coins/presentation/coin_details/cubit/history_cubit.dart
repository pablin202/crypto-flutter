import 'package:bloc/bloc.dart';
import 'package:crypto_app/src/coins/domain/models/history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1day_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1month_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1week_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_1year_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_6months_history.dart';
import 'package:crypto_app/src/coins/domain/usecases/params/get_history_params.dart';
import 'package:equatable/equatable.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(
      {required Get1DayHistory get1dayHistory,
      required Get1WeekHistory get1weekHistory,
      required Get1MonthHistory get1monthHistory,
      required Get6MonthsHistory get6monthsHistory,
      required Get1YearHistory get1yearHistory})
      : _get1dayHistory = get1dayHistory,
        _get1weekHistory = get1weekHistory,
        _get1monthHistory = get1monthHistory,
        _get6monthsHistory = get6monthsHistory,
        _get1yearHistory = get1yearHistory,
        super(HistoryInitial());

  final Get1DayHistory _get1dayHistory;
  final Get1WeekHistory _get1weekHistory;
  final Get1MonthHistory _get1monthHistory;
  final Get6MonthsHistory _get6monthsHistory;
  final Get1YearHistory _get1yearHistory;

  Future<void> getOneDayHistory(String id) async {
    emit(GettingHistory());
    final result = await _get1dayHistory(GetHistoryParams(id: id));

    result.fold((failure) => emit(HistoryError(failure.toString())), (history) {
      emit(HistoryLoaded(history));
    });
  }

  Future<void> getOneWeekHistory(String id) async {
    emit(GettingHistory());
    final result = await _get1weekHistory(GetHistoryParams(id: id));

    result.fold((failure) => emit(HistoryError(failure.toString())), (history) {
      emit(HistoryLoaded(history));
    });
  }

  Future<void> getOneMonthHistory(String id) async {
    emit(GettingHistory());
    final result = await _get1monthHistory(GetHistoryParams(id: id));

    result.fold((failure) => emit(HistoryError(failure.toString())), (history) {
      emit(HistoryLoaded(history));
    });
  }

  Future<void> getSixMonthHistory(String id) async {
    emit(GettingHistory());
    final result = await _get6monthsHistory(GetHistoryParams(id: id));

    result.fold((failure) => emit(HistoryError(failure.toString())), (history) {
      emit(HistoryLoaded(history));
    });
  }

  Future<void> getOneYearHistory(String id) async {
    emit(GettingHistory());
    final result = await _get1yearHistory(GetHistoryParams(id: id));

    result.fold((failure) => emit(HistoryError(failure.toString())), (history) {
      emit(HistoryLoaded(history));
    });
  }

}
