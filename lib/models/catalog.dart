class Item {
  int id;
  String name;
  String desc;
  num price;
  String color;
  String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

class CatalogModel {
  static final items = [
    (Item(
        id: 1,
        name: "Johnny Depp",
        desc: "Samundar ka lutera",
        price: 100,
        color: "#fff000d",
        image:
            "https://static.wikia.nocookie.net/horrormovies/images/0/0b/Johnny_Depp.jpg/revision/latest/top-crop/width/360/height/450?cb=20090928231953"))
  ];
}
