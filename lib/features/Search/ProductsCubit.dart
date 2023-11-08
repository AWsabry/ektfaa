import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Search/ProductsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// enum Privacy { Private, Public }

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(SuperProductsStates());
  static ProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  final uploadProductFormKey = GlobalKey<FormState>();

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

  void uploadProducts(
    context, {
    required String phoneNumber,
  }) async {
    searchedProducts.clear();
    emit(newProductsStateLoading());
    Dio().post("${EktfaaConstants.BaseUrl}/get_products/$phoneNumber",
        data: {}).then((value) {
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
}
