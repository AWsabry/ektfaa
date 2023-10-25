abstract class ProductsStates {}

class SuperProductsStates extends ProductsStates {}

class newProductsStateLoading extends SuperProductsStates {}

class ProductSearchSuccess extends SuperProductsStates {}

class ProductSearchFail extends SuperProductsStates {
  final String error;

  ProductSearchFail(this.error);
}

class GetEmailFromSharedPreferenceDone extends ProductsStates {}
