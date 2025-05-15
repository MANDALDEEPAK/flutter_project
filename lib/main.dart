import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';


void main  () async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(ProviderScope(child: const Main()));
}

class Main extends ConsumerWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}


class SimpleStream extends StatefulWidget {
  const SimpleStream({super.key});

  @override
  State<SimpleStream> createState() => _SimpleStreamState();
}

class _SimpleStreamState extends State<SimpleStream> {
  int count = 0;

  final controller = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: controller.stream,
          builder: (context, snapshot) {
            return Center(child: Text(snapshot.data.toString()));
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          controller.sink.add(count++);
        },
        child: Text('Add'),

      ),
    );
  }
}

