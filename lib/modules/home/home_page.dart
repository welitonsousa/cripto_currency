import 'package:crypto_currency/core/ui/app_state.dart';
import 'package:crypto_currency/core/utils/formatters.dart';
import 'package:crypto_currency/modules/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends AppState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Crypto Currency'),
        actions: [Obx(() => searchComponent())],
      ),
      body: Obx(() => _body()),
    );
  }

  Widget _body() {
    if (controller.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
      itemCount: controller.currencies.length,
      itemBuilder: (context, index) {
        final currency = controller.currencies[index];
        return ListTile(
          title: Text(currency.name),
          leading: Image.network(currency.image, width: 50),
          subtitle: Text(Formatters.money(currency.currentPrice)),
          trailing: percentComponent(currency.changePercent),
        );
      },
    );
  }

  Widget searchComponent() {
    return Visibility(
      visible: controller.searching,
      replacement: IconButton(
        icon: const Icon(Icons.search),
        onPressed: () => controller.searching = true,
      ),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            onChanged: controller.search,
            autofocus: true,
            decoration: InputDecoration(
              labelText: 'Pesquisar',
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => controller.searching = false,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget percentComponent(double value) {
    Color color = value > 0 ? Colors.green : Colors.red;
    return Text(
      "${value.toStringAsFixed(2)} %",
      style: TextStyle(
        color: color,
        fontSize: 18,
      ),
    );
  }
}
