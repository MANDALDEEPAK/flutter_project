import 'package:flutter/material.dart';
import 'package:flutter_proj/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// void m (){
//   for(int i = 0; i<=1000000;i++){
//   }
//   print('sello world');
// }
Future<String> getSome(){
  return Future.delayed(Duration(seconds: 2),(){
    // for(int i = 0; i<=1000000;i++){}
    print('2sec gone');
    return 'hello world';
  });
}
void a (){
  print('hello world');
}

void main(){
  //m();
  a();
  getSome();
  runApp(ProviderScope(child:Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
