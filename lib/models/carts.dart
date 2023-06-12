class Cart {
  final String title, description;
  final List<String> images;
  final double rating, price;
  final bool isFavorite, isPopular;

  Cart({
    required this.images,
    this.rating = 0.0,
    this.isFavorite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
  });

  toJson() {
    return {
      "Title": title,
      "Price": price,
      "Description": description,
    };
  }
}
