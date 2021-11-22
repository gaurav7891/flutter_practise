import 'package:day_1/models/catalog.dart';
import 'package:day_1/widgets/home_widgets/add_to_cart.dart';
import 'package:day_1/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.mOnly(right: 16),
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: Column(
        children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
            height: 30,
            arcType: VxArcType.CONVEY,
            edge: VxEdge.TOP,
            child: Container(
              color: context.cardColor,
              width: context.screenWidth,
              child: Column(
                children: [
                  catalog.name.text.xl4.color(context.accentColor).bold.make(),
                  catalog.desc.text.textStyle(context.captionStyle!).xl.make(),
                  "Gubergren amet lorem labore ut vero, et abore ut vero, et aamet labore voluptua duo rebum eirmod et ipsum dolore. Dolore eirmod tempor clita sea voluptua consetetur aliquyam, dolores voluptua diam sanctus elitr et gubergren et eos lorem, voluptua vero ea eirmod sadipscing. Clita."
                      .text
                      .textStyle(context.captionStyle!)
                      .make()
                      .p16()
                ],
              ).py64(),
            ),
          ))
        ],
      ),
    );
  }
}
