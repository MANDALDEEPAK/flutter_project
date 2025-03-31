import 'package:flutter/material.dart';
class StackWidget extends StatelessWidget {
  const StackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Stack(
        children: [
          CircleAvatar(),
          Positioned(
            right: 0,
              left: 0,
              top: 0,
              child: Text('Hello!')
          ),

        ],
      ),
    );
  }
}
