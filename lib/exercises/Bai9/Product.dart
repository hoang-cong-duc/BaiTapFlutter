class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rating;

  /// 🔥 Thêm trường này để mở bài gốc
  final String url;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
    required this.url,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      image: json['image'] ?? '',
      rating: (json['rating'] != null && json['rating']['rate'] != null)
          ? (json['rating']['rate'] as num).toDouble()
          : 0.0,

      /// Nếu API không có trường url → để rỗng
      /// Hoặc bạn tự gán theo id: "https://fakestoreapi.com/products/ID"
      url: json['url'] ?? "https://fakestoreapi.com/products/${json['id']}",
    );
  }
}
