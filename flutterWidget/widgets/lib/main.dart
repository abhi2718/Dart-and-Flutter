import 'package:flutter/material.dart';
import './button.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
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
                '$_count',
                style: const TextStyle(fontSize: 26),
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
                onSubmitted: (value) {
                  print(value);
                },
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
                  )), // when textField is enable i.e enabled: true bydefault it is true
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
            )
          ],
        ),
      ),
    );
  }
}
