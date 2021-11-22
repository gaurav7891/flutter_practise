import 'package:day_1/models/catalog.dart';

class CartModel {
    // this is how we make the class as singleton in dart
  static final cartModel = CartModel._internal();
  CartModel._internal();

  factory CartModel() => cartModel;

  late CatalogModel _catalog;
  // Collections of IDs - store IDs of each item
  final List<int> _itemIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
