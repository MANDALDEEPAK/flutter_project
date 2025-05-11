import 'package:flutter/material.dart';
import 'package:flutter_proj/features/authentication/data/auth_repository.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.amber,
              ), child: Text('Drawer Header'),
            ),
            ListTile(
              onTap:  (){
               AuthRepository.userSignOut();
              },
              title: Text('SignOut'),
              leading: Icon(Icons.exit_to_app),
            )
          ],
        ),

      ),
    );
  }
}
