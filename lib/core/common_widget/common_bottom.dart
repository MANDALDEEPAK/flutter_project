import 'package:flutter/material.dart';

class CommonBottom extends StatelessWidget {
  final VoidCallback func;
  final String label;
  final Color color;
  const CommonBottom({super.key,required this.func,required this.label,required this.color});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white
        ),onPressed: func, child: Text(label));
  }
}
