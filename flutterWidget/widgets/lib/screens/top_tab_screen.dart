import 'package:flutter/material.dart';
class TopTabScreen extends StatefulWidget {
  const TopTabScreen({super.key});
  @override
  State<TopTabScreen> createState() => _TopTabScreenState();
}

class _TopTabScreenState extends State<TopTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.clean_hands),
              text: "Screen1",
            ),
            Tab(
              icon: Icon(Icons.wallet),
              text: "Screen2",
            )
          ],)
        ),
        body: const TabBarView(children: [
          Screen1(),
          Screen2()
        ]),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("screen1")),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("screen2")),
    );
  }
}