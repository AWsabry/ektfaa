import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ektfaa/Components/Constants/constatnts.dart';
import 'package:ektfaa/features/Product/ProductsStates.dart';
import 'package:ektfaa/loading.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

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

  getSearchedProducts(context,
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
      {required String phoneNumber,
      required List? tags,
      required String? image}) async {
    // uploadedProducts.clear();
    emit(newProductsUploadingStateLoading());

    Dio().post("${EktfaaConstants.BaseUrl}/user_uploads/", data: {
      "user": phoneNumber,
      "product_english_name": productEnglishNameController.text,
      "product_arabic_name": productArabicNameController.text,
      "image": image,
      "user_tags": tags.toString(),
      "description": descriptionController.text,
      "serial_number": serialNumberController.text
    }).then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        uploadedProducts = value.data["Names"];
        uploadedProducts.clear();
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

  Future<String?> uploadImage(context,
      {required File? imageFile,
      required List tags,
      required String phoneNumber}) async {
    emit(UploadImageInitial());
    try {
      if (imageFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Loading(),
            ),
          ),
        );
        uploadProducts(context,
            phoneNumber: phoneNumber, tags: tags, image: "** No Image **");

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              EktfaaConstants.productAdded,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );

        ProductsCubit.get(context).tagsController.clear();
        ProductsCubit.get(context).productEnglishNameController.clear();
        ProductsCubit.get(context).productArabicNameController.clear();
        ProductsCubit.get(context).descriptionController.clear();
        ProductsCubit.get(context).serialNumberController.clear();
        tags.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(
              child: Loading(),
            ),
          ),
        );
        String fileName = basename(imageFile.path);
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('user_uploaded_images/$fileName');

        UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String downloadURL = await taskSnapshot.ref.getDownloadURL();

        if (downloadURL.isEmpty || downloadURL == "") {
          downloadURL = "No Image";
        }
        print(downloadURL);

        uploadProducts(context,
            phoneNumber: phoneNumber, tags: tags, image: downloadURL);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              EktfaaConstants.productAdded,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        );

        ProductsCubit.get(context).tagsController.clear();
        ProductsCubit.get(context).productEnglishNameController.clear();
        ProductsCubit.get(context).productArabicNameController.clear();
        ProductsCubit.get(context).descriptionController.clear();
        ProductsCubit.get(context).serialNumberController.clear();
        tags.clear();
        return downloadURL;
      }
    } catch (e) {
      print('Error uploading image: $e');
      return null;
    }
    return null;
  }

  List<dynamic> userUploadedList = [];
  userUploadedProducts(
    context, {
    required String phoneNumber,
  }) async {
    userUploadedList.clear();
    emit(newProductsStateLoading());
    Dio()
        .get("${EktfaaConstants.BaseUrl}/user_searched_products/$phoneNumber/")
        .then((value) {
      if (value.statusCode == 200) {
        userUploadedList.clear();
        userUploadedList = value.data["Names"];
      } else if (value.statusCode == 302) {
        message = value.data["message"];
      }

      emit(ProductSearchSuccess());
    }).catchError((error) {
      userUploadedList.clear();
      emit(ProductSearchFail(error.toString()));
    });
    // return data;
  }
}
