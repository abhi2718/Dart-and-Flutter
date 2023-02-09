import 'package:flutter/material.dart';

// 225 end 

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _ageFocousNode = FocusNode();
  final _descriptionNode = FocusNode();

  @override
  void dispose() {
    _ageFocousNode.dispose();
    _descriptionNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Form")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Form(
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
                      ),

                      // TextField For multi line input
                      TextFormField(
                        focusNode: _descriptionNode,
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        maxLines: 3,
                        keyboardType: TextInputType.multiline,
                      )
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
