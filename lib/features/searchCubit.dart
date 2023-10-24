import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/ProductsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// enum Privacy { Private, Public }

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(SuperProductsStates());
  static ProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  List<dynamic> searchedProducts = [];
  var message;

  void getSearchedProductsInRestaurant(valueRequest) {
    searchedProducts.clear();
    var data = "No Data";
    emit(newProductsStateLoading());
    Dio()
        .get("${EktfaaConstants.BaseUrl}/get_products/$valueRequest")
        .then((value) {
      if (value.statusCode == 200) {
        searchedProducts = value.data['Names'];
      } else if (value.statusCode == 302) {
        message = value.data["message"];
      }
      emit(ProductSearchSuccess());
    }).catchError((error) {
      searchedProducts.clear();
      print("okkkkkkkkkk");
      print("${EktfaaConstants.BaseUrl}/get_products/$valueRequest");
      emit(ProductSearchFail(error.toString()));
    });
    // return data;
  }
}
