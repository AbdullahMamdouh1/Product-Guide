import 'package:hive/hive.dart';

part 'product.g.dart'; // مهم: هذا يُولد تلقائياً عبر build_runner

@HiveType(typeId: 0)
class Product {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String barcode;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final double price;

  Product({
    required this.id,
    required this.title,
    required this.barcode,
    required this.description,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'] ?? '',
      barcode: json['barcode'] ?? '',
      description: json['description'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'barcode': barcode,
    'description': description,
    'price': price,
  };
}
