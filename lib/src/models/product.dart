// class Product {
//   final int id;
//   final String name;
//   final String image;
//   final String description;
//   final String weight;
//   final String price;

//   Product({
//     required this.id,
//     required this.name,
//     required this.image,
//     required this.description,
//     required this.weight,
//     required this.price,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'],
//       name: json['product_name'],
//       image: json['image'],
//       description: json['description'],
//       weight: json['weight'],
//       price: json['price'],
//     );
//   }
// }

class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final String weight;
  final String price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.weight,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['product_name'] ?? 'No Name',
      image: json['image'] ?? '',
      description: json['description'] ?? 'No Description',
      weight: json['weight'] ?? '',
      price: json['price'] ?? '',
    );
  }
}
