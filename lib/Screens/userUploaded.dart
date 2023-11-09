import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Product/ProductsCubit.dart';
import 'package:ektfaa/features/Product/ProductsStates.dart';
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

  @override
  Widget build(BuildContext context) {
    ProductsCubit.get(context)
        .userUploadedProducts(context, phoneNumber: phone);

    print(phone);
    return BlocBuilder<ProductsCubit, ProductsStates>(
        builder: (context, state) {
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
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ProductsCubit.get(context).userUploadedList.length,
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
                        ProductsCubit.get(context).userUploadedList[index]
                            ['product_arabic_name'], // Your name in Arabic
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        ProductsCubit.get(context).userUploadedList[index][
                            'product_english_name'], // Your description in Arabic
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
                        children: [
                          if (ProductsCubit.get(context).userUploadedList[index]
                                  ['pending'] ==
                              true)
                            const SizedBox(
                              height: 10,
                            ),
                          const Text(
                            'Pending',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.redAccent),
                          ),
                          Text(formattedDate.toString()),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Divider(
                        color: Colors.grey,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
    });
  }
}
