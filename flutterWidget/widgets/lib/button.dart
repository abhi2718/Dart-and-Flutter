import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/conter_provider.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Function sum;

  const CustomButton(this.onPressed, this.sum, {super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<CounterProvider>(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Consumer<CounterProvider>(
        builder: (context, provider, child) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColorDark,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () {
              provider.increase();
            },
            child: Column(
              children: [
                Text(' Count ${provider.count}'),
                child!,
              ],
            ),
          );
        },
        child: const Text("I will not change "),
      ),
    );
  }
}
