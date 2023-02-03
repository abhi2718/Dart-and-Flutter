import 'package:flutter/material.dart';
import './drawer.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  int pageIndex = 0;
  void handleTab(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  final screens = [const Screen1(), const Screen2()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AppBar"),
      ),
      drawer: const CustomDrawer(),
      body: screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.blue,
          currentIndex: pageIndex,
          onTap: handleTab,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.hail),
                activeIcon: Icon(Icons.holiday_village),
                label: "tab1"),
            BottomNavigationBarItem(
                icon: Icon(Icons.scale),
                activeIcon: Icon(Icons.pedal_bike),
                label: "tab2"),
          ]),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return (Column(
      children: [
        Center(
          child: InkWell(
            onTap: () {
              var id = 34;
              Navigator.of(context).pop(id);
            },
            child: const Text("Go Back"),
          ),
        )
      ],
    ));
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("screen2"));
  }
}
