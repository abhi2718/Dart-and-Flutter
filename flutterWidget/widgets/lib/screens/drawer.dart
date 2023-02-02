import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                
              },
              child: const Text("Link"),
            )
          ],
        ),
      ),
    );
  }
}