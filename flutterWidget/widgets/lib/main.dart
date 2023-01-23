import 'dart:ui';

import 'package:flutter/material.dart';
import './button.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: "Quicksand",
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                    fontFamily: "OpenSans", fontSize: 16, color: Colors.red),
              ),
          appBarTheme: AppBarTheme(
            titleTextStyle: ThemeData.light()
                .textTheme
                .copyWith(
                  headline6: const TextStyle(
                    fontFamily: "OpenSans",
                    fontSize: 20,
                  ),
                )
                .headline6,
          ),
        ),
        home: const _App(),
      ),
    );

class _App extends StatefulWidget {
  const _App();
  @override
  State<_App> createState() => _AppState();
}

class _AppState extends State<_App> {
  var _count = "0";
  var users = ["Ram", "Sita" "Ram", "Sita", "Ram", "Sita"];
  void _setCount(String text) {
    setState(() {
      _count = text.toString();
    });
  }

  void openModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        context: context,
        builder: (_) {
          return (Column(
            children: const [Text("Modal Bottom Sheet")],
          ));
        });
  }

  final _textFieldController = TextEditingController(text: "Ram");
  @override
  Widget build(BuildContext context) {
    final dimension = MediaQuery.of(context).size;
    final deviceOrientation = MediaQuery.of(context).orientation;
    // print(dimension.width);
    // print(dimension.height);
    // print(deviceOrientation == Orientation.portrait);
    // print(MediaQuery.of(context).padding.top);
    // final appBarHeight = AppBar().preferredSize.height;
    // print(appBarHeight);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Widget"),
        actions: [
          IconButton(
            onPressed: () => openModalBottomSheet(context),
            icon: const Icon(
              Icons.add,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.black38,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(16))),
              child: Text(
                _count,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            CustomButton(
              () {},
              () {},
            ),
            Container(
              color: Colors.amber,
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Text(
                    users[index],
                    textAlign: TextAlign.center,
                  );
                },
                itemCount: users.length,
              ),
            ),
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
              onTap: () {},
              child: const Text("Inkwell"),
            ),
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Image.network(
                "https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75",
                width: 200,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                keyboardType: TextInputType.text,
                // onSubmitted called when done button from keyboard is clicked
                onSubmitted: (value) {},
                controller: _textFieldController,
                decoration: InputDecoration(
                  // enabled: false, // it will disable the text field
                  labelText: "Email Address",
                  hintText: "abhiwebdev2718@gmail.com",
                  suffixIcon: GestureDetector(
                    onTap: () {
                      _setCount(_textFieldController.text);
                    },
                    child: const Icon(Icons.email_outlined),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  )), // when text field is disabled i.e enabled: false
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(221, 173, 137, 137),
                      width: 2,
                    ),
                  ), // when textField is enable i.e enabled: true bydefault it is true
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  ) // when inputBox receive focous (when user clicks)
                      ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.blue,
                    child: const Text('Text1'),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    child: const Text('Text2'),
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    color: Colors.blue,
                    child: const Text('Text3'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              height: 100,
              child: FittedBox(
                child: Image.network(
                  "https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75",
                ),
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Text('leading'),
              ),
              title: Text("title"),
              subtitle: Text("subtitle"),
              trailing: Text("trailing"),
            )
          ],
        ),
      ),
    );
  }
}
