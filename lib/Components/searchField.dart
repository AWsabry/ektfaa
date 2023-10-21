import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: TextFormField(
        cursorColor: Colors.redAccent,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(
              color: Colors.grey, // Change the active border color
            ),
          ),
          hintText: 'Search for products',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
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
