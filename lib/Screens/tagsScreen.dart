import 'package:flutter/material.dart';

class MultiTagTextField extends StatefulWidget {
  const MultiTagTextField({super.key});

  @override
  _MultiTagTextFieldState createState() => _MultiTagTextFieldState();
}

class _MultiTagTextFieldState extends State<MultiTagTextField> {
  TextEditingController textController = TextEditingController();
  List<String> tags = [];

  void addTag(String tag) {
    setState(() {
      tags.add(tag);
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: tags.map((tag) {
                return Chip(
                  label: Text(tag),
                  onDeleted: () {
                    setState(() {
                      tags.remove(tag);
                    });
                  },
                );
              }).toList(),
            ),
            TextFormField(
              controller: textController,
              onFieldSubmitted: (value) {
                if (value.isNotEmpty) {
                  addTag(value);
                  print(tags);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
