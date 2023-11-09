abstract class ProductsStates {}

class SuperProductsStates extends ProductsStates {}

class newProductsStateLoading extends SuperProductsStates {}

class newProductsUploadingStateLoading extends SuperProductsStates {}

class ProductSearchSuccess extends SuperProductsStates {}

class ProductUploadSuccess extends SuperProductsStates {}

class ProductUploadFail extends SuperProductsStates {
  final String error;

  ProductUploadFail(this.error);
}

class ProductSearchFail extends SuperProductsStates {
  final String error;

  ProductSearchFail(this.error);
}

class GetEmailFromSharedPreferenceDone extends ProductsStates {}

class ClearListSuccessfully extends ProductsStates {}

class UploadImageInitial extends ProductsStates {}
