import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/business_logics/bloc/login/login_bloc.dart';

import 'package:shopping/data/service/navigator/generate_route.dart' as router;
import 'package:shopping/presentation/presentation.dart';

import 'data/data.dart';

class ShoppingApp extends StatefulWidget {
  const ShoppingApp({super.key});

  @override
  State<ShoppingApp> createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: getIt<NavigationService>().navigatorKey,
      theme: themeData(),
      onGenerateRoute: router.generateRoute,
      home: BlocProvider(
        create: (context) => LoginBloc()..add(LoginLoaded()),
        child: const LoginView(),
      ),
    );
  }
}
