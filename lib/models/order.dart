import 'user.dart';
import 'product.dart';

class BaseModel {
  String getInfo() => "BaseModel info";
}

class Order extends BaseModel {
  User _customer;
  Product _product;
  int _quantity;
  String _status;

  Order({
    required User customer,
    required Product product,
    required int quantity,
    required String status,
  })  : _customer = customer,
        _product = product,
        _quantity = quantity,
        _status = status;

  User get customer => _customer;
  set customer(User value) => _customer = value;

  Product get product => _product;
  set product(Product value) => _product = value;

  int get quantity => _quantity;
  set quantity(int value) => _quantity = value;

  String get status => _status;
  set status(String value) => _status = value;

  int get totalPrice => _product.price * _quantity;

  @override
  String getInfo() =>
      "Order: ${_product.name} x $_quantity | Status: $_status | Customer: ${_customer.username}";
}
