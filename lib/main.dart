import 'package:ecommerce_with_bloc/core/routes/app_route.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkThemeData,
      darkTheme: AppThemeData.darkThemeData,
      routerConfig: _appRouter.config(),
    );
  }
}
