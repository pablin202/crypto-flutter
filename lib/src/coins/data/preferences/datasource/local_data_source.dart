import 'package:crypto_app/core/errors/exceptions.dart';
import 'package:crypto_app/src/coins/domain/models/rates.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  const LocalDataSource();

  Future<void> cachePreferRate(Rate rate);

  Future<Rate> checkPreferRate();
}

class LocalDataSourceImpl extends LocalDataSource {
  const LocalDataSourceImpl(this._prefs);

  final SharedPreferences _prefs;

  @override
  Future<void> cachePreferRate(Rate rate) async {
    try {
      await _prefs.setString('id', rate.id);
      await _prefs.setString('symbol', rate.symbol);
      await _prefs.setString('currencySymbol', rate.currencySymbol);
      await _prefs.setString('type', rate.type);
      await _prefs.setDouble('rateUsd', rate.rateUsd);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<Rate> checkPreferRate() async {
    try {
      var id = _prefs.getString('id') ?? "united-states-dollar";
      var symbol = _prefs.getString('symbol') ?? "USD";
      var currencySymbol = _prefs.getString('currencySymbol') ?? "\$";
      var type = _prefs.getString('type') ?? "fiat";
      var rate = _prefs.getDouble('rateUsd') ?? 1.0;
      return Rate(
          id: id,
          symbol: symbol,
          currencySymbol: currencySymbol,
          type: type,
          rateUsd: rate);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
