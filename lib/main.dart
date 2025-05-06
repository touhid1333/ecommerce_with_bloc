import 'package:ecommerce_with_bloc/core/services/locator_service.dart';
import 'package:ecommerce_with_bloc/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'core/theme/theme.dart';

void main() async {
  await locatorServiceInit();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.lightThemeData,
      home: HomeScreen(),
    );
  }
}
