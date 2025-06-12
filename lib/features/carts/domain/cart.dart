import 'package:hive/hive.dart';

part 'cart.g.dart';

@HiveType(typeId: 0)
 class Cart extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String image;

  @HiveField(2)
  int price;

  @HiveField(3)
  int qty;

  @HiveField(4)
  String id;


 Cart({
    required this.title,
    required this.image,
    required this.price,
    required this.qty,
   required this.id
  });

 factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      title: json['title'],
      image: json['image'],
      price: json['price'],
      qty: json['qty'],
      id: json['id']
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'image': image,
    'price': price,
    'qty': qty,
    'id': id
  };

}