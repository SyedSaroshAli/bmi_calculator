import 'package:flutter/material.dart';

class NeuBox2 extends StatelessWidget {
  final Widget? child;
  const NeuBox2({super.key,
  required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:Colors.deepPurple ,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          //darker shadow on bottom right
          BoxShadow(
            color: Colors.grey.shade800,
            blurRadius: 15,
            offset: const Offset(4, 4)
          ),
 
          //lighter shadow on top left
          const BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: const Offset(-4, -4)
          )
 
        ]
      ),
      child: child,
     
    );
  }
}