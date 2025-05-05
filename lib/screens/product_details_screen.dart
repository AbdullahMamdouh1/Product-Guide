import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('تفاصيل المنتج')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('الاسم :  ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  Text(product.title,style: TextStyle( fontSize: 18)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(' السعر:  ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  Text('${product.price} جنيه  ',style: TextStyle( fontSize: 18)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('الباركود:  ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
                  Text(product.barcode,style: TextStyle( fontSize: 18)),
                ],
              ),
              const SizedBox(height: 20),
              const Text('الوصف:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
        Text((product.description?.trim().isNotEmpty ?? false)
            ? product.description!
            : 'لا يوجد وصف'),
            ],
          ),
        ),
      ),
    );
  }
}
