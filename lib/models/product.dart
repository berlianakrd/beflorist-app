class BaseModel {
  String getInfo() => "BaseModel info";
}

class Product extends BaseModel {
  String _name;
  int _price; 
  int _stock;
  String _image; 

  Product({
    required String name,
    required int price,
    required int stock,
    required String image,
  })  : _name = name,
        _price = price,
        _stock = stock,
        _image = image;

  // Getter & Setter
  String get name => _name;
  set name(String value) => _name = value;

  int get price => _price;
  set price(int value) => _price = value;

  int get stock => _stock;
  set stock(int value) => _stock = value;

  String get image => _image;
  set image(String value) => _image = value;

  // Format harga jadi string (contoh: Rp50.000)
  String get formattedPrice {
    return "Rp${_price.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => "${m[1]}.")}";
  }

  @override
  String getInfo() =>
      "Product: $_name | Price: $_price | Stock: $_stock | Image: $_image";
}
