import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/ProductsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Privacy { Private, Public }

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(SuperProductsStates());
  static ProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  List<dynamic> searchedProducts = [];
  bool? noProducts;
  Future GetSearchedProductsInRestaurant(
    context,
  ) async {
    var data = "No Data";
    // emit(newProductsStateLoading());
    await Dio()
        .get("${EktfaaConstants.BaseUrl}/get_products/${searchController.text}")
        .then((value) {
      searchedProducts = value.data['Names'];
      // AppLogger.i(searchedProducts.toString());
      print(searchedProducts);
      if (searchedProducts.isEmpty) {
        noProducts = true;
      } else {
        noProducts = false;
      }
      emit(ProductSearchSuccess());
    }).catchError((error) {
      emit(ProductSearchFail(error));
    });
    return data;
  }
}
