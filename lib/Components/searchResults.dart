// import 'package:ektfaa/features/ProductsStates.dart';
// import 'package:ektfaa/features/searchCubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchResults extends StatelessWidget {
//   const SearchResults({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductsCubit, ProductsStates>(
//       builder: (context, state) {
//         return 
        
//         ListView.separated(
//           shrinkWrap: true,
//           itemCount: list.length,
//           separatorBuilder: (context, index) {
//             return const SizedBox(
//               height: 15,
//             );
//           },
//           itemBuilder: (context, index) {
//             const Row(
//               textDirection: TextDirection
//                   .rtl, 
//               children: <Widget>[
//                 CircleAvatar(
//                   radius: 40,
//                   backgroundColor: Colors.redAccent,
//                   child: CircleAvatar(
//                     radius: 38,
//                     backgroundImage: AssetImage('assets/Images/pepsi.png'),
//                   ),
//                 ),
//                 SizedBox(
//                     width:
//                         10), // Add some spacing between the image and the text
//                 Column(
//                   crossAxisAlignment:
//                       CrossAxisAlignment.start, // Align text to the start
//                   children: [
//                     Text(
//                       'بيبسي', // Your name in Arabic
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       'مشروبات', // Your description in Arabic
//                       style: TextStyle(fontSize: 14, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ],
//             );
//             return null;
//           },
//         );
      
//       },
//     );
//   }
// }
