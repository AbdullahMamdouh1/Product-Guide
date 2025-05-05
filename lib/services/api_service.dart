import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import '../models/product.dart';

class ApiService {
  static const String apiUrl = 'https://barcode.roaa.website/public/api/products/allProudcts';

  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        final products = (data as List).map((e) => Product.fromJson(e)).toList();

        // حفظ في Hive
        final box = Hive.box<Product>('productsBox');
        await box.clear();
        for (var p in products) {
          await box.put(p.id, p);
        }

        return products;
      } else {
        throw Exception('فشل في تحميل المنتجات من السيرفر');
      }
    } catch (e) {
      // لو فشل الاتصال بالنت، نرجع البيانات من Hive
      final box = Hive.box<Product>('productsBox');
      return box.values.toList();
    }
  }
}
