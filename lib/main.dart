import 'package:crypto_currency/core/bindings/app_bindings.dart';
import 'package:crypto_currency/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Crypto Currency',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialBinding: AppBindings(),
      getPages: [...AppRouters.pages],
    );
  }
}
