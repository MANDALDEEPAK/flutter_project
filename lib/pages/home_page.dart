import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_proj/app_theme/app_sizes.dart';
import 'package:flutter_proj/pages/widgets/book_list.dart';
import 'package:flutter_proj/pages/widgets/carousel_widget.dart';
import 'package:flutter_proj/pages/widgets/stack_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var arrName = ['Study-Flutter','Practice-Dart','Leave Applause on the Article','Go TO School'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi John,'),
        centerTitle: false,
        // backgroundColor: Color(0xff8AB2A6),
        // foregroundColor: Color(0xff443627),
        actions: [
          IconButton(
            onPressed: () {
              print('Hello Sanju');
            },
            icon: Icon(CupertinoIcons.search, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              print('Hello Sanju');
            },
            icon: Icon(CupertinoIcons.bell_fill, color: Colors.black),
          ),
        ],
      ),
      // drawer: Drawer(
      //   backgroundColor: Colors.pink,
      //   child: Text('Deepak'),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [

            //StackWidget(),
            AppSizes.gapH10,
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                bottomRight: Radius.circular(90),
              ),
              child: Image.asset('assets/images/sun-sets.jpg'),
            ),
            AppSizes.gapH20,
            BookList(),
            AppSizes.gapH20,
            CarouselWidget(),
          ],
        ),
      ),
    );
  }
}
