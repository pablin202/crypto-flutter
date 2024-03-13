import 'package:bloc/bloc.dart';
import 'package:crypto_app/src/coins/domain/usecases/get_all_rates.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required GetAllRates getAllRates})
      : _getAllRates = getAllRates,
        super(SettingsInitial());

  final GetAllRates _getAllRates;


}
