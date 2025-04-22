import 'package:flutter/material.dart';
import 'package:flutter_proj/features/products/presentation/product_list.dart';
import 'package:flutter_proj/features/recipes/presentation/recipes.dart';
List<Widget> _widget = [
  ProductList(),
  Recipes(),
];
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _widget[_index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.green,
        currentIndex: _index,
        onTap: (int index){
          setState(() {
            _index=index;
          });;
        },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.browse_gallery,),label: 'Gallery')
          ]
      ),
    );
  }
}
