import 'package:flutter/material.dart';
import 'package:flutter_proj/features/home/presentation/controllers/user_controller.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../authentication/data/auth_repository.dart';



class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileStream = ref.watch(userProfileStreamProvider);
    return profileStream.when(
        data: (user){
          return  Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(user.image),
                      ),
                      Text(user.username),
                      SizedBox(height: 5,),
                      Text(user.email),
                    ],
                  ),
                ),

                if(user.role == 'admin')  ListTile(
                  onTap: (){
                     context.pushNamed(AppRoute.admin.name);
                  },
                  leading: Icon(Icons.admin_panel_settings),
                  title: const Text('Admin Panel'),
                ),

                ListTile(
                  onTap: (){
                    AuthRepository.userSignOut();
                  },
                  leading: Icon(Icons.exit_to_app),
                  title: const Text('Sign Out'),
                ),

              ],
            ),
          );
        },
        error: (err, st) => Text(err.toString()),
        loading: () => const Center(child: CircularProgressIndicator())
    );
  }
}