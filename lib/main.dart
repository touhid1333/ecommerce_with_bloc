import 'package:ecommerce_with_bloc/core/routes/app_route.dart';
import 'package:ecommerce_with_bloc/core/services/locator_service.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_with_bloc/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme/theme.dart';

void main() async {
  await locatorServiceInit();
  await GetStorage.init();
  await Hive.initFlutter();
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
          ),
          BlocProvider<CartBloc>(
            create: (context) => CartBloc(),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.darkThemeData,
          darkTheme: AppThemeData.darkThemeData,
          routerConfig: _appRouter.config(),
        ));
  }
}
