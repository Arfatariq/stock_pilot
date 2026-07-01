import 'dart:io';
import 'package:stock_pilot/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProductService {
  final supabase = Supabase.instance.client;

  // upload image to supabase storage
  Future<String?> uploadImage(File imageFile) async {
    try {
      final filename = DateTime.now().millisecondsSinceEpoch.toString();
      final path = 'products/$filename.jpg';

      await supabase.storage
          .from('product-images')
          .upload(path, imageFile);

      final url = supabase.storage
          .from('product-images')
          .getPublicUrl(path);

      return url;
    } catch (e) {
      print('image upload error: $e');
      return null;
    }
  }

  // add product — takes a ProductModel now
  Future<void> addProduct(ProductModel product) async {
    await supabase.from('products').insert(product.toMap());
  }

  // fetch all products — returns List<ProductModel> now
  Future<List<ProductModel>> getProducts() async {
    final response = await supabase
        .from('products')
        .select()
        .order('created_at', ascending: false);

    // convert each map to ProductModel
    return response
        .map((item) => ProductModel.fromMap(item))
        .toList();
  }
}