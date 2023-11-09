import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/Screens/DashBoard.dart';
import 'package:ektfaa/features/Search/ProductsCubit.dart';
import 'package:ektfaa/features/Search/ProductsStates.dart';
import 'package:ektfaa/features/SignUp/sign_up_cubit.dart';
import 'package:ektfaa/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    await SignUpCubit.get(context).getPhoneFromSharedPreference();
    phone = SignUpCubit.get(context).phoneFromSharedPreference;
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
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DashBoard(
                            selectedIndex: 1,
                          )));
            },
            child: const Icon(
              Icons.camera,
              color: Colors.white,
            ),
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
                      child: TextFormField(
                        controller: ProductsCubit.get(context).searchController,
                        cursorColor: Colors.redAccent,
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
                              color:
                                  Colors.grey, // Change the active border color
                            ),
                          ),
                          hintText: EktfaaConstants.searchHint,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14))),
                              child: IconButton(
                                  color: Colors.grey,
                                  onPressed: () {
                                    ProductsCubit.get(context)
                                        .clearListOfProducts();
                                  },
                                  icon: const Icon(Icons.close)),
                            ),
                          ),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13.0)),
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
                                  "The product you searched for '${ProductsCubit.get(context).searchController.text}' is not subject to Ektfaa regulations, but here are the alternatives for you:",
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
                                                    'https://media.licdn.com/dms/image/D4D0BAQEOPeLwDmQsMw/company-logo_100_100/0/1698413985728?e=1707350400&v=beta&t=2k6vq52Fvw2rZg6go6UhSc1m4hbeft34gH1bI1tai6s')
                                                : NetworkImage(
                                                    "${EktfaaConstants.BaseUrl}/uploads/" +
                                                        ProductsCubit.get(context)
                                                                .searchedProducts[index]
                                                            ['image'])),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: 240,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ProductsCubit.get(context)
                                                                .searchedProducts[
                                                            index][
                                                        'product_arabic_name'], // Your name in Arabic
                                                    textAlign: TextAlign.right,
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    ProductsCubit.get(context)
                                                                .searchedProducts[
                                                            index][
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
                            : state is GetEmailFromSharedPreferenceDone
                                ? const Center(
                                    child: Loading(),
                                  )
                                : Center(
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.redAccent),
                                        padding: MaterialStateProperty.all<
                                            EdgeInsetsGeometry>(
                                          const EdgeInsets.all(
                                              16.0), // Padding around the button's content
                                        ),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Adjust the border radius as needed
                                            side: const BorderSide(
                                              color: Colors.red, // Border color
                                              width: 2.0, // Border width
                                            ),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        ProductsCubit.get(context)
                                            .getSearchedProducts(
                                          context,
                                          valueRequest:
                                              ProductsCubit.get(context)
                                                  .searchController
                                                  .text,
                                          phoneNumber: phone,
                                        );
                                      },
                                      child: Text(
                                        EktfaaConstants.searchHint,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),

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
