class Product {
  final String? id;
  final String name;
  final double price;
  final String imgUrl;
  final String desc;

  Product(
      {this.id,
      required this.name,
      required this.price,
      required this.imgUrl,
      required this.desc});

  Product copyWith({
    String? id,
    String? name,
    double? price,
    String? imgUrl,
    String? desc,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      desc: desc ?? this.desc,
    );
  }
}
