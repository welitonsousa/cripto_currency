import 'package:crypto_currency/models/currency_model.dart';
import 'package:crypto_currency/models/rest_client.dart';
import 'package:crypto_currency/repositories/currency/currency_repository.dart';

class CurrencyRepositoryImp implements CurrencyRepository {
  final RestClient _restClient;

  CurrencyRepositoryImp({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<List<CurrenyModel>> getAllCurrencies() async {
    final response = await _restClient.get(
      '/coins/markets',
      query: {'vs_currency': 'usd'},
    );
    return response.body
        .map<CurrenyModel>((c) => CurrenyModel.fromMap(c))
        .toList();
  }
}
