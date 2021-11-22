import 'package:day_1/core/store.dart';
import 'package:day_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store?.cartModel._itemIds.add(item.id);
  }
}
