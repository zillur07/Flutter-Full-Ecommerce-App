class FavoriteItem {
  final int id;
  final String name;
  final String image;
  final String weight;
  final double price;
  final String? description; // <-- নতুন ফিল্ড

  FavoriteItem({
    required this.id,
    required this.name,
    required this.image,
    required this.weight,
    required this.price,
    this.description,
  });
}
