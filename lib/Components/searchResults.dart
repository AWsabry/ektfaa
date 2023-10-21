import 'package:flutter/material.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection:
          TextDirection.rtl, // Set text direction to right-to-left (for Arabic)
      children: <Widget>[
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.redAccent,
          child: CircleAvatar(
            radius: 38,
            backgroundImage: AssetImage('assets/Images/pepsi.png'),
          ),
        ),
        SizedBox(width: 10), // Add some spacing between the image and the text
        Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            Text(
              'بيبسي', // Your name in Arabic
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'مشروبات', // Your description in Arabic
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
