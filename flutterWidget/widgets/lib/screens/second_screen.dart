import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    var name = arguments['name']!;
    var email = arguments['email']!;

    return Scaffold(
      appBar: AppBar(
        title:  Text(name),
      ),
      body:  Center(
        child: Text(email),
      ),
    );
  }
}
