import 'package:crypto_currency/models/currency_model.dart';

abstract class CurrencyRepository {
  Future<List<CurrenyModel>> getAllCurrencies();
}
