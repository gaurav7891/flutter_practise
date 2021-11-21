import 'package:day_1/models/catalog.dart';
import 'package:day_1/widgets/home_widgets/catalog_header.dart';
import 'package:day_1/widgets/home_widgets/catalog_list.dart';
import 'package:day_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final double days = 10;
    String name = "Flutter";
    bool _isMale = false;
    num temp = 30.5; // takes both integer and double
    var day = 'Tuesday';
    const pi = 3.14; // value cannot be modified
    final x = 12; // data can be modified

    return Scaffold(
        backgroundColor: MyTheme.creamColor,
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
