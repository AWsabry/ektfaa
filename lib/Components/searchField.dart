// import 'package:ektfaa/features/ProductsStates.dart';
// import 'package:ektfaa/features/searchCubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SearchField extends StatelessWidget {
//   const SearchField({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ProductsCubit, ProductsStates>(
//         builder: (context, state) {
//       return 
//       Form(
//         key: key,
//         child: Container(
//           padding: const EdgeInsets.only(top: 10),
//           child: TextFormField(
//             cursorColor: Colors.redAccent,
//             validator: (value) {
//               if (value!.isNotEmpty) {
//                 return null;
//               } else {
//                 return 'Search must not be empty';
//               }
//             },
//             decoration: const InputDecoration(
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 borderSide: BorderSide(
//                   color: Colors.grey, // Change the active border color
//                 ),
//               ),
//               hintText: 'Search for products',
//               prefixIcon: Icon(
//                 Icons.search,
//                 color: Colors.grey,
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(13.0)),
//               ),
//             ),
//             onChanged: (value) async {
//               print("a7aaa $value");
//               await ProductsCubit.get(context)
//                   .getSearchedProductsInRestaurant(context, value.toString());
//             },
//           ),
//         ),
//       );
    
//     });
//   }
// }
