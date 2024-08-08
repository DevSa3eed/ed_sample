import 'package:flutter/material.dart';
import 'MyApp.dart';
import 'core/dependancy_injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDi();

  runApp(MyApp());
}
