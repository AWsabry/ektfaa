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

class UserUploadsLoading extends ProductsStates {}

class UserUploadSuccess extends ProductsStates {}

class UserUploadFailed extends SuperProductsStates {
  final String error;

  UserUploadFailed(this.error);
}

class UploadImageInitial extends ProductsStates {}
