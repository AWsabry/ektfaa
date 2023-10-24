import 'package:ektfaa/features/ProductsStates.dart';
import 'package:ektfaa/features/searchCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  var controller = TextEditingController();
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent the screen from going back
        return false;
      },
      child:
          BlocBuilder<ProductsCubit, ProductsStates>(builder: (context, state) {
        var list = ProductsCubit.get(context).searchedProducts;
        var message = ProductsCubit.get(context).message;

        if (state is newProductsStateLoading) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: widget.controller,
                  cursorColor: Colors.redAccent,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Search must not be empty';
                    }
                  },
                  decoration: const InputDecoration(
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
                    ProductsCubit.get(context)
                        .getSearchedProductsInRestaurant(value);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: CircularProgressIndicator(),
              ),
            ],
          );
        } else if (state is ProductSearchFail) {
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: TextFormField(
                  controller: widget.controller,
                  cursorColor: Colors.redAccent,
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      return null;
                    } else {
                      return 'Search must not be empty';
                    }
                  },
                  decoration: const InputDecoration(
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
                    ProductsCubit.get(context)
                        .getSearchedProductsInRestaurant(value);
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text("There is no arab products"),
              ),
            ],
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false, // Remove the back icon
              title: const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Products Checker",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 0,
              actions: const [],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextFormField(
                        controller: widget.controller,
                        cursorColor: Colors.redAccent,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return 'Search must not be empty';
                          }
                        },
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(
                              color:
                                  Colors.grey, // Change the active border color
                            ),
                          ),
                          hintText: 'Search for products',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
                          ),
                        ),
                        onChanged: (value) {
                          ProductsCubit.get(context)
                              .getSearchedProductsInRestaurant(value);
                        },
                      ),
                    ),

                    // SearchField(),

                    const SizedBox(
                      height: 30,
                    ),

                    list.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            itemCount: list.length,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemBuilder: (context, index) {
                              print(list);
                              return Row(
                                textDirection: TextDirection.rtl,
                                children: <Widget>[
                                  const CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.redAccent,
                                    child: CircleAvatar(
                                      radius: 38,
                                      backgroundImage:
                                          AssetImage('assets/Images/pepsi.png'),
                                    ),
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // Add some spacing between the image and the text
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Align text to the start
                                    children: [
                                      Text(
                                        list[index][
                                            'product_arabic_name'], // Your name in Arabic
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        list[index][
                                            'product_english_name'], // Your description in Arabic
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          )
                        : const Center(
                            child: Text("Please Check Arab Products"),
                          ),

                    // const SearchResults(),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      }),
    );
  }
}
