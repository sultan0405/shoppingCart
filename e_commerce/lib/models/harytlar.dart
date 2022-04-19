class Haryt{
final String name;
final int price;
final int id;
bool isAdded;
bool isSelected;

  Haryt({
    required this.name,
    required this.price,
    required this.id, 
    this.isAdded = false,
    this.isSelected = false});
}

class OnNull{
  final String title;
  OnNull({required this.title});
}


List<Haryt> harytlar = [
  Haryt(name: "Iphone X", price:420, id:1),
  Haryt(name: "Iphone 13", price:720, id:2),
  Haryt(name: "Samsung A42", price:520, id:3),
  Haryt(name: "Iphone 11pro", price:420, id:4),
];