import 'package:crypto_currency/models/currency_model.dart';
import 'package:crypto_currency/repositories/currency/currency_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final CurrencyRepository _repository;

  HomeController({required CurrencyRepository currencyRepository})
      : _repository = currencyRepository;

  final _loading = false.obs;
  final _searching = false.obs;
  final _searchText = ''.obs;
  final _currencies = <CurrenyModel>[].obs;

  bool get loading => _loading.value;
  bool get searching => _searching.value;
  String get searchText => _searchText.value;

  List<CurrenyModel> get currencies {
    return _currencies
        .where((p) => p.name.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
  }

  set searching(bool value) => _searching(value);
  void search(String value) => _searchText(value);

  Future<void> getAllCurrencies() async {
    try {
      _loading(true);
      final response = await _repository.getAllCurrencies();
      _currencies.assignAll(response);
    } catch (e) {
      Get.snackbar(
        'ops',
        'Algo deu errado',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      _loading(false);
    }
  }

  @override
  void onReady() {
    getAllCurrencies();
    super.onReady();
  }

  @override
  void onInit() {
    ever<bool>(_searching, (value) => _searchText(''));
    super.onInit();
  }
}
