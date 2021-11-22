import 'package:day_1/models/cart.dart';
import 'package:day_1/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalogModel;
  late CartModel cartModel;

  MyStore() {
    catalogModel = CatalogModel();
    cartModel = CartModel();
    cartModel.catalog = catalogModel;
  }
}
