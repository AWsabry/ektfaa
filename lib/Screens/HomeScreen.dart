import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Theme.dart';
import 'package:ektfaa/features/Product/ProductsCubit.dart';
import 'package:ektfaa/features/Product/ProductsStates.dart';
import 'package:ektfaa/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String phone = "";
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      phone = prefs.getString('PhoneNumber') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Prevent the screen from going back
        return false;
      },
      child:
          BlocBuilder<ProductsCubit, ProductsStates>(builder: (context, state) {
        print(phone);
        var message = ProductsCubit.get(context).message;
        return Scaffold(
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // FloatingActionButton(
              //   backgroundColor: Colors.black,
              //   onPressed: () {
              //     // push(context, const BarCode());
              //   },
              //   child: const Icon(
              //     Icons.barcode_reader,
              //     color: Colors.white,
              //   ),
              // ),
              const SizedBox(
                height: 20,
              ),
              if (state is newProductsStateLoading)
                const SizedBox(
                  height: 0,
                )
              else
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    ProductsCubit.get(context).getSearchedProducts(
                      context,
                      valueRequest:
                          ProductsCubit.get(context).searchController.text,
                      phoneNumber: phone,
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
            ],
          ),
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

            elevation: 0,
            actions: const [],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 08.0, left: 25, right: 25),
              child: Form(
                key: ProductsCubit.get(context).searchKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: SizedBox(
                        height: 50,
                        child: TextFormField(
                          controller:
                              ProductsCubit.get(context).searchController,
                          cursorColor: Colors.black,
                          onFieldSubmitted: (value) {
                            ProductsCubit.get(context)
                                .searchKey
                                .currentState!
                                .validate();

                            ProductsCubit.get(context).getSearchedProducts(
                                context,
                                valueRequest: ProductsCubit.get(context)
                                    .searchController
                                    .text,
                                phoneNumber: phone);
                          },
                          onChanged: (value) {
                            ProductsCubit.get(context).searchController.text =
                                value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return EktfaaConstants.searchEmpty;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(
                                color: Colors
                                    .grey, // Change the active border color
                              ),
                            ),
                            hintText: EktfaaConstants.searchHint,
                            hintStyle: const TextStyle(
                                color: AppColors.grey, fontSize: 12),
                            labelStyle: const TextStyle(
                                color: AppColors.grey, fontSize: 10),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                height: 10,
                                width: 10,
                                decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(14))),
                                child: IconButton(
                                  color: Colors.grey,
                                  onPressed: () {
                                    ProductsCubit.get(context)
                                        .clearListOfProducts();
                                  },
                                  icon: const Icon(Icons.close, size: 14),
                                ),
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13.0)),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // SearchField(),

                    const SizedBox(
                      height: 30,
                    ),

                    ProductsCubit.get(context).searchedProducts.isNotEmpty
                        ? Column(
                            children: [
                              Center(
                                child: Text(
                                  "The product you searched for '${ProductsCubit.get(context).searchController.text}' is not subject to Ektfaa regulations, but here are the local or trusted alternatives for you:",
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
                                itemCount: ProductsCubit.get(context)
                                    .searchedProducts
                                    .length,
                                separatorBuilder: (context, index) {
                                  return const SizedBox(
                                    height: 15,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundColor: Colors.transparent,
                                        child: CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            radius: 30,
                                            backgroundImage: ProductsCubit.get(
                                                                    context)
                                                                .searchedProducts[index]
                                                            ['image'] ==
                                                        null ||
                                                    ProductsCubit.get(context)
                                                                .searchedProducts[index]
                                                            ['image'] ==
                                                        ""
                                                ? const NetworkImage(
                                                    'https://firebasestorage.googleapis.com/v0/b/ektfaaorganization.appspot.com/o/1.png?alt=media&token=1ef0b8f2-00ee-46bf-85d3-799ea117ee2a')
                                                : NetworkImage(
                                                    "${EktfaaConstants.BaseUrl}/uploads/" +
                                                        ProductsCubit.get(context)
                                                                .searchedProducts[index]
                                                            ['image'])),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 240,
                                        child: Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          ProductsCubit.get(
                                                                      context)
                                                                  .searchedProducts[index]
                                                              [
                                                              'product_english_name'],
                                                          textAlign:
                                                              TextAlign.left,
                                                          maxLines: 3,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 11,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        ProductsCubit.get(
                                                                        context)
                                                                    .searchedProducts[
                                                                index][
                                                            'product_arabic_name'],
                                                        maxLines: 4,
                                                        overflow: TextOverflow
                                                            .ellipsis,
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
                                            const SizedBox(width: 8),
                                            const Positioned(
                                              top: 0,
                                              right: 0,
                                              child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Colors.green,
                                                size: 12,
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
                            ? Column(
                                children: [
                                  Text(EktfaaConstants.noProductsResults),
                                  Center(
                                    child: Text(
                                      EktfaaConstants.searchNote,
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                  )
                                ],
                              )
                            : state is newProductsStateLoading
                                ? const Center(
                                    child: Loading(),
                                  )
                                : const SizedBox(
                                    height: 0,
                                  ),

                    // : Center(
                    //     child: ElevatedButton(
                    //       style: ButtonStyle(
                    //         backgroundColor:
                    //             MaterialStateProperty.all<Color>(
                    //                 Colors.redAccent),
                    //         padding: MaterialStateProperty.all<
                    //             EdgeInsetsGeometry>(
                    //           const EdgeInsets.all(
                    //               16.0), // Padding around the button's content
                    //         ),
                    //         shape: MaterialStateProperty.all<
                    //             RoundedRectangleBorder>(
                    //           RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(
                    //                 10.0), // Adjust the border radius as needed
                    //             side: const BorderSide(
                    //               color: Colors.red, // Border color
                    //               width: 2.0, // Border width
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         ProductsCubit.get(context)
                    //             .getSearchedProducts(
                    //           context,
                    //           valueRequest:
                    //               ProductsCubit.get(context)
                    //                   .searchController
                    //                   .text,
                    //           phoneNumber: phone,
                    //         );
                    //       },
                    //       child: Text(
                    //         EktfaaConstants.searchButton,
                    //         style: const TextStyle(
                    //             fontWeight: FontWeight.w400),
                    //       ),
                    //     ),
                    //   ),

                    const SizedBox(
                      height: 70,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
