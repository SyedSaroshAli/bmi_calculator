import 'package:flutter/material.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key,
  required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.grey.shade900 ,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 18,
            offset: const Offset(4, 4)
          ),
 
          //lighter shadow on top left
          const BoxShadow(
            color: Colors.black,
            blurRadius: 18,
            offset: const Offset(-4, -4)
          )
 
        ]
      ),
      child: child,
      padding: EdgeInsets.all(12),
    );
  }
}