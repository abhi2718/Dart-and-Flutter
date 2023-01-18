import 'package:flutter/material.dart';
import './button.dart';

void main() => runApp(const _App());

class _App extends StatefulWidget {
  const _App();
  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  var _count = 0;
  var users = ["Ram", "Sita"];
  void _setCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Widget"),
        ),
        body: Column(
          children: [
            Container(
              padding:const EdgeInsets.all(2),
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black38,
                border:Border.all(
                  color: Colors.black,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(16))
              ),
              child: Text(
                '$_count',
                style: const TextStyle(fontSize: 26),
                textAlign: TextAlign.center,
              ),
            ),
            CustomButton(
              _setCount,
              () {},
            ),
            ...users.map((e) => Text(e)),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: const Text("Text Button"),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              label: const Text("Text Button"),
              icon: const Icon(Icons.access_alarm),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.green)),
              onPressed: (() {}),
              child: const Text("Outlined Button"),
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.green)),
              onPressed: (() {}),
              label: const Text("Outlined Button"),
              icon: const Icon(Icons.home_max_outlined),
            ),
            ElevatedButton.icon(
              style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.green)),
              onPressed: (() {}),
              label: const Text("Outlined Button"),
              icon: const Icon(Icons.home_max_outlined),
            ),
            IconButton(
              onPressed: () {},
             icon: const Icon(Icons.home_max_outlined),
             ),
             InkWell(
              onTap: () {
                
              },
              child: const Text("Inkwell"),
             ),
             Card(
              elevation: 2,
              shape:
               RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              child: Image.network(
                "https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75",
                width: 200,
                height: 200,
                ),
             )

          ],
        ),
      ),
    );
  }
}

