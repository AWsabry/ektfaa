import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Search/ProductsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

// enum Privacy { Private, Public }

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(SuperProductsStates());
  static ProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  final tagsController = TextEditingController();
  final productEnglishNameController = TextEditingController();
  final productArabicNameController = TextEditingController();
  final descriptionController = TextEditingController();
  final serialNumberController = TextEditingController();
  final uploadProductFormKey = GlobalKey<FormState>();
  final searchKey = GlobalKey<FormState>();

  List<dynamic> searchedProducts = [];
  var message;
  void clearListOfProducts() {
    searchedProducts.clear();
    searchController.clear();
    emit(ClearListSuccessfully());
  }

  void getSearchedProducts(context,
      {required String phoneNumber, required String valueRequest}) async {
    searchedProducts.clear();
    emit(newProductsStateLoading());
    Dio()
        .get(
            "${EktfaaConstants.BaseUrl}/get_products/$phoneNumber/$valueRequest")
        .then((value) {
      if (value.statusCode == 200) {
        searchedProducts.clear();
        searchedProducts = value.data["Names"];
      } else if (value.statusCode == 302) {
        message = value.data["message"];
      }

      emit(ProductSearchSuccess());
    }).catchError((error) {
      searchedProducts.clear();
      emit(ProductSearchFail(error.toString()));
    });
    // return data;
  }

  List<dynamic> uploadedProducts = [];
  void uploadProducts(context,
      {required String phoneNumber, required XFile? image}) async {
    uploadedProducts.clear();
    emit(newProductsUploadingStateLoading());

    Dio().post("${EktfaaConstants.BaseUrl}/user_uploads/", data: {
      "user": phoneNumber,
      "product_english_name": productEnglishNameController.text,
      "product_arabic_name": productArabicNameController.text,
      // "image": image,
      "user_tags": tagsController.text,
      "description": descriptionController,
      "serial_number": serialNumberController.text
    }).then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        uploadedProducts.clear();
        uploadedProducts = value.data["Names"];
      } else {
        print(value.statusCode);
      }
      emit(ProductUploadSuccess());
    }).catchError((error) {
      uploadedProducts.clear();
      emit(ProductUploadFail(error.toString()));
    });
    // return data;
  }
}
