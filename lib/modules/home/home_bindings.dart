import 'package:crypto_currency/modules/home/home_controller.dart';
import 'package:crypto_currency/repositories/currency/currency_repository.dart';
import 'package:crypto_currency/repositories/currency/currency_repository_imp.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<CurrencyRepository>(
      CurrencyRepositoryImp(restClient: Get.find()),
    );
    Get.put(
      HomeController(currencyRepository: Get.find()),
    );
  }
}
