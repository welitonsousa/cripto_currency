import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

abstract class AppState<S extends StatefulWidget, C extends GetxController>
    extends State<S> {
  C get controller => Get.find<C>();
}
