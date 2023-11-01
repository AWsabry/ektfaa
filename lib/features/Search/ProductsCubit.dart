import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Search/ProductsStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

// enum Privacy { Private, Public }

class ProductsCubit extends Cubit<ProductsStates> {
  ProductsCubit() : super(SuperProductsStates());
  static ProductsCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();

  List<dynamic> searchedProducts = [];
  var message;

  void getSearchedProducts(
    valueRequest,
    context,
  ) async {
    ProductsCubit.get(context).getPhoneFromSharedPreferenceInProductsCubit();
    String phoneNumber = ProductsCubit.get(context).phone;

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

  String phone = "";
  getPhoneFromSharedPreferenceInProductsCubit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    phone = sharedPreferences.getString("PhoneNumber")!;
    emit(GetEmailFromSharedPreferenceDone());
  }
}
