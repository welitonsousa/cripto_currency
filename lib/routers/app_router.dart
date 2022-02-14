import 'package:crypto_currency/modules/home/home_bindings.dart';
import 'package:crypto_currency/modules/home/home_page.dart';
import 'package:get/route_manager.dart';

class AppRouters {
  static final pages = [
    GetPage(
      name: '/',
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
  ];
}
