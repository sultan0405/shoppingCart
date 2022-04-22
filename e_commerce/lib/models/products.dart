// TODO: AT KOYGAN WAGTYNG KURY INGLIS DILINI ULAN. E.G GOOD/PRODUCT

class Product {
  final String name;
  final int price;
  final int id;
  bool isAdded;
  bool isSelected;

  Product({
    required this.name,
    required this.price,
    required this.id,
    this.isAdded = false,
    this.isSelected = false,
  });
}

List<Product> productsDb = [
  Product(name: "Iphone X", price: 420, id: 1),
  Product(name: "Iphone 13", price: 720, id: 2),
  Product(name: "Samsung A42", price: 520, id: 3),
  Product(name: "Iphone 11pro", price: 420, id: 4),
];
