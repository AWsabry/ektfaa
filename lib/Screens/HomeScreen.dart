import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Search/ProductsCubit.dart';
import 'package:ektfaa/features/Search/ProductsStates.dart';
import 'package:ektfaa/loading.dart';
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
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // Remove the back icon
            title: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                EktfaaConstants.homeTitle,
                style: const TextStyle(color: Colors.black),
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
                          return EktfaaConstants.searchEmpty;
                        }
                      },
                      decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(
                            color:
                                Colors.grey, // Change the active border color
                          ),
                        ),
                        hintText: EktfaaConstants.searchHint,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(13.0)),
                        ),
                      ),
                      onChanged: (value) {
                        ProductsCubit.get(context).getSearchedProducts(
                          value,
                          context,
                        );
                      },
                    ),
                  ),

                  // SearchField(),

                  const SizedBox(
                    height: 30,
                  ),

                  list.isNotEmpty
                      ? Column(
                          children: [
                            Center(
                              child: Text(
                                "The product you searched for '${widget.controller.text}' is not subject to Ektfaa regulations, but here are the alternatives for you:",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: list.length,
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 15,
                                );
                              },
                              itemBuilder: (context, index) {
                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundColor: Colors.transparent,
                                      child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 40,
                                          backgroundImage:
                                              list[index]['image'] == null ||
                                                      list[index]['image'] == ""
                                                  ? const AssetImage(
                                                      'assets/Images/3.png')
                                                  : AssetImage(
                                                      list[index]['image'])),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: 150,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  list[index][
                                                      'product_arabic_name'], // Your name in Arabic
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  list[index][
                                                      'product_english_name'], // Your description in Arabic
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        )
                      : state is ProductSearchFail
                          ? Center(
                              child: Text(EktfaaConstants.noProductsResults),
                            )
                          : state is newProductsStateLoading
                              ? const Center(
                                  child: Loading(),
                                )
                              : Center(
                                  child:
                                      Text(EktfaaConstants.searchDescription),
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
      }),
    );
  }
}
