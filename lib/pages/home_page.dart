import 'package:day_1/models/catalog.dart';
import 'package:day_1/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:day_1/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double days = 10;
    String name = "Flutter";
    bool _isMale = false;
    num temp = 30.5; // takes both integer and double
    var day = 'Tuesday';
    const pi = 3.14; // value cannot be modified
    final x = 12; // data can be modified

    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
