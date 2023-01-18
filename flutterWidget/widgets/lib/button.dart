import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Function sum;

  const CustomButton(this.onPressed, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          padding:const EdgeInsets.all(16),
        ),
        onPressed: onPressed,
        child: const Text("Elevated Button"),
      ),
    );
  }
}
