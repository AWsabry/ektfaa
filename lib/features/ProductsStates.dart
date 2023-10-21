abstract class ProductsStates {}

class SuperProductsStates extends ProductsStates {}

class ProductSearchSuccess extends SuperProductsStates {}

class ProductSearchFail extends SuperProductsStates {
  final String error;

  ProductSearchFail(this.error);
}
