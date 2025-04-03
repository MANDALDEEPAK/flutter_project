import 'package:flutter/material.dart';
import 'package:flutter_proj/app_theme/app_sizes.dart';
import 'package:flutter_proj/providers/notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_proj/providers/provider.dart';

import '../providers/providers.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Providers'),
      ),
      body: Column(
        children: [
          Text('This is Normal Provider',style: Theme.of(context).textTheme.headlineLarge,),
          AppSizes.gapH14,
          Consumer(
            builder: (context,ref,child){
              final someNumber = ref.watch(someVar);
              return Text('$someNumber',style: Theme.of(context).textTheme.displayLarge,);
            }
          ),
          AppSizes.gapH20,
          Consumer(
            builder: (context,ref,child) {
              final counter = ref.watch(counterProvider);
              return Column(
                children: [
                  Text('$counter', style: Theme
                      .of(context)
                      .textTheme
                      .headlineLarge,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            ref.read(counterProvider.notifier).increment();
                          }, child: Text('increment')),
                      AppSizes.gapW10,
                      ElevatedButton(
                          onPressed: () {
                            ref.read(counterProvider.notifier).decrement();
                          }, child: Text('decrement')),
                    ],
                  )
                ],
              );
            }
          ),
        ],
      ),
    );
  }
}

