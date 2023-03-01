import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// 225 end

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _ageFocousNode = FocusNode();
  final _descriptionNode = FocusNode();
  final _imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final data = {"name": "", "age": 0, "description": "", "imgUrl": ""};

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _ageFocousNode.dispose();
    _descriptionNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  Future<dynamic> futureFunction() async {
    await Future.delayed(Duration(seconds: 2));
    return 98;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Form")),
      body: Column(
        children: [
          FutureBuilder(
              future: futureFunction(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.connectionState == ConnectionState.done ||
                    snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  } else {
                    return Text("something went wrong!");
                  }
                } else {
                  return Text("something went wrong!");
                }
              }),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Name",
                        ),
                        // To show keyboard done button or next button
                        textInputAction: TextInputAction.done,
                        // onFieldSubmitted -> this will run when user will press done button from keyboard
                        onFieldSubmitted: (value) {
                          // value will print the value present in the text field
                          //  print(value);
                          FocusScope.of(context).requestFocus(_ageFocousNode);
                        },
                        onSaved: (newValue) {
                          data["name"] = newValue!;
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name is required"; // return some error message when there is some potential error
                          }
                          return null; // retun null when there is no error
                        },
                      ),
                      TextFormField(
                        focusNode: _ageFocousNode,
                        decoration: const InputDecoration(
                          labelText: "Age",
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_descriptionNode);
                        },
                        onSaved: (newValue) {
                          data["age"] = newValue!;
                        },
                      ),

                      // TextField For multi line input
                      TextFormField(
                        focusNode: _descriptionNode,
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                        onSaved: (newValue) {
                          data["description"] = newValue!;
                        },
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: TextFormField(
                              controller: _imageController,
                              decoration:
                                  const InputDecoration(labelText: "Image URL"),
                              keyboardType: TextInputType.url,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value) {
                                setState(() {});
                              },
                              onSaved: (newValue) {
                                data["imgUrl"] = newValue!;
                              },
                            ),
                          ),
                          _imageController.text.isEmpty
                              ? const Text("Enter image URL")
                              : SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: Image.network(
                                    _imageController.text,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: _saveForm, child: const Text("Submit"))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// 228
