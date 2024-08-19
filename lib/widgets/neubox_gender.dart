import 'package:flutter/material.dart';

class NeuBoxGender extends StatelessWidget {
  final Widget? child;
  Color color ;
  NeuBoxGender({super.key,
  required this.child,
  required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ,
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
      padding: EdgeInsets.all(12),
    );
  }
}