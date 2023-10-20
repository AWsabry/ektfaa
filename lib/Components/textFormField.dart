import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        cursorColor: Colors.black,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Colors.black, // Change the active border color
            ),
          ),
          labelText: 'Search',
          labelStyle: TextStyle(
            color: Colors.red, // Change the label text color
          ),
          hintText: 'Enter your search query',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.green,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
          ),
        ),
        onChanged: (value) {
          // Implement your search logic here
          // The `value` parameter contains the user's input.
          // You can use it to filter and display search results.
        },
      ),
    );
  }
}
