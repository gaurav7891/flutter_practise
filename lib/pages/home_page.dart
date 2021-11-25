import 'package:day_1/core/store.dart';
import 'package:day_1/models/cart.dart';
import 'package:day_1/models/catalog.dart';
import 'package:day_1/utils/routes.dart';
import 'package:day_1/widgets/home_widgets/catalog_header.dart';
import 'package:day_1/widgets/home_widgets/catalog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/619eefa762ed886f91544be8";
  var secretKey =
      "\$2b\$10\$J.pTkvG4ZdqJOp4jQNslq.5g18bntr/gf2by0zL3FX7YrypbdLOhy";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    //var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var client = http.Client();
    var response = await  client.get(Uri.parse(url), headers: {"secret-key": secretKey});
    var catalogJson = response.body;
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartModel;
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, _, __) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: context.theme.buttonColor,
            child: const Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.items.length,
              textStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(
                    child:
                        CircularProgressIndicator().centered().py16().expand(),
                  )
              ],
            ),
          ),
        ));
  }
}
