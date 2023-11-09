import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Product/ProductsCubit.dart';
import 'package:ektfaa/features/Product/ProductsStates.dart';
import 'package:ektfaa/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class UserUploadedProducts extends StatefulWidget {
  const UserUploadedProducts({Key? key}) : super(key: key);

  @override
  State<UserUploadedProducts> createState() => _UserUploadedProductsState();
}

class _UserUploadedProductsState extends State<UserUploadedProducts> {
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

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    ProductsCubit.get(context)
        .userUploadedProducts(context, phoneNumber: phone);

    print(phone);
    return BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
      if (state is UserUploadsLoading) {
        // Set isLoading to true when loading starts
        isLoading = true;
      } else if (state is UserUploadsLoading || state is UserUploadFailed) {
        // Set isLoading to false when loading is complete
        isLoading = false;
      }

      return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              EktfaaConstants.screenTitleUploadedProducts,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (isLoading) const Loading(),
                  if (!isLoading)
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          ProductsCubit.get(context).userUploadedList.length,
                      itemBuilder: (context, index) {
                        String dateString = ProductsCubit.get(context)
                            .userUploadedList[index]['created'];
                        DateTime dateTime = DateTime.parse(dateString);

                        String formattedDate =
                            DateFormat.yMd().add_Hms().format(dateTime);
                        return Column(
                          children: [
                            ListTile(
                              title: Text(
                                ProductsCubit.get(context)
                                        .userUploadedList[index][
                                    'product_english_name'], // Your name in Arabic
                                textAlign: TextAlign.left,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                ProductsCubit.get(context)
                                        .userUploadedList[index]
                                    ['product_arabic_name'],
                                // Your description in Arabic
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  if (ProductsCubit.get(context)
                                          .userUploadedList[index]['pending'] ==
                                      true)
                                    const Text(
                                      'Pending',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.redAccent),
                                    ),
                                  if (ProductsCubit.get(context)
                                                  .userUploadedList[index]
                                              ['publish'] ==
                                          true &&
                                      ProductsCubit.get(context)
                                                  .userUploadedList[index]
                                              ['pending'] ==
                                          false)
                                    const Text(
                                      'Published',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                  Text(
                                    formattedDate.toString(),
                                    style: const TextStyle(
                                        fontSize: 10, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Divider(
                                color: Colors.grey,
                              ),
                            )
                          ],
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
