part of 'history_cubit.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();
}

class HistoryInitial extends HistoryState {
  @override
  List<Object?> get props => [];
}

class GettingHistory extends HistoryState {
  @override
  List<Object?> get props => [];
}
class HistoryLoaded extends HistoryState {
  final List<History> history;

  const HistoryLoaded(this.history);

  @override
  List<Object?> get props => history.map((e) => e.time).toList();
}

class HistoryError extends HistoryState {
  final String message;
  const HistoryError(this.message);
  @override
  List<Object?> get props => [message];
}
