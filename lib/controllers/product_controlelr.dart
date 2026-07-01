import 'dart:io';
import 'package:get/get.dart';
import 'package:stock_pilot/models/product_model.dart';
import 'package:stock_pilot/services/product_services.dart';


class ProductController extends GetxController {
  final productservice = ProductService();

  // now a list of ProductModel instead of raw maps
  var products = <ProductModel>[].obs;

  var isloading = false.obs;
  var isadding = false.obs;
  var selectedimage = Rxn<File>();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isloading.value = true;
    try {
      final result = await productservice.getProducts();
      products.value = result;
    } catch (e) {
      print('fetch products error: $e');
    }
    isloading.value = false;
  }

  void setImage(File image) {
    selectedimage.value = image;
  }

  Future<void> addProduct({
    required String name,
    required String description,
    required String price,
    required String stock,
    required String supplier,
  }) async {
    if (name.isEmpty || price.isEmpty || stock.isEmpty) {
      Get.snackbar('Error', 'Please fill in all required fields',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isadding.value = true;

    try {
      String? imageurl;

      if (selectedimage.value != null) {
        imageurl = await productservice.uploadImage(selectedimage.value!);
      }

      // create a ProductModel
      final product = ProductModel(
        id: '',
        name: name,
        description: description,
        price: double.tryParse(price) ?? 0,
        stock: int.tryParse(stock) ?? 0,
        supplier: supplier,
        imageUrl: imageurl,
        createdAt: '',
      );

      // pass the model to service
      await productservice.addProduct(product);

      await fetchProducts();
      selectedimage.value = null;
      Get.back();

      Get.snackbar('Done', 'Product added successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('add product error: $e');
      Get.snackbar('Error', 'Failed to add product',
          snackPosition: SnackPosition.BOTTOM);
    }

    isadding.value = false;
  }
}