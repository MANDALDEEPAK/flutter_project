import 'package:flutter/material.dart';
import 'package:flutter_proj/features/shared/user_state_provider.dart';
import 'package:flutter_proj/routes/route_enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(userStateProviderProvider);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Text(
                  user.username,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Text(user.email, style: const TextStyle(color: Colors.white)),
                Text('Role: ${user.role}', style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
          if(user.role == 'Admin')ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Admin Dashboard'),
            onTap: () {
              context.pushNamed(AppRoute.admin.name);
            },
          ),

          ListTile(
            leading: const Icon(Icons.reorder),
            title: const Text('Orders'),
            onTap: () {
              context.pushNamed(AppRoute.order.name);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
               ref.read(userStateProviderProvider.notifier).removeUser();
            },
          ),

        ],
      ),
    );
  }
}
