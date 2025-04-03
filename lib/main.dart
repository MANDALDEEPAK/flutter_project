
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(){
  runApp(ProviderScope(child:Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
        theme:ThemeData(
          appBarTheme: AppBarTheme(),
        ),
    );
  }
}
