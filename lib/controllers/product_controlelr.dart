import 'dart:io';
import 'package:get/get.dart';
import 'package:stock_pilot/models/product_model.dart';
import 'package:stock_pilot/services/product_services.dart';


class ProductController extends GetxController {
  final productservice = ProductService();

  // all products from supabase
  var allproducts = <ProductModel>[].obs;

  // filtered list that the screen shows
  var filteredproducts = <ProductModel>[].obs;

  var isloading = false.obs;
  var isadding = false.obs;
  var selectedimage = Rxn<File>();

  // search and filter state
  var searchquery = ''.obs;
  var selectedsort = 'Newest'.obs;

  final List<String> sortoptions = [
    'Newest',
    'Oldest',
    'Price: Low to High',
    'Price: High to Low',
    'Stock: Low to High',
    'Stock: High to Low',
  ];

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    isloading.value = true;
    try {
      final result = await productservice.getProducts();
      allproducts.value = result;
      // apply filter after fetching
      applyfilter();
    } catch (e) {
      print('fetch products error: $e');
    }
    isloading.value = false;
  }

  // called every time search or sort changes
  void applyfilter() {
    var result = allproducts.toList();

    // apply search
    if (searchquery.value.isNotEmpty) {
      result = result.where((p) {
        final name = p.name.toLowerCase();
        final supplier = p.supplier.toLowerCase();
        final query = searchquery.value.toLowerCase();
        return name.contains(query) || supplier.contains(query);
      }).toList();
    }

    // apply sort
    if (selectedsort.value == 'Newest') {
      result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    } else if (selectedsort.value == 'Oldest') {
      result.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    } else if (selectedsort.value == 'Price: Low to High') {
      result.sort((a, b) => a.price.compareTo(b.price));
    } else if (selectedsort.value == 'Price: High to Low') {
      result.sort((a, b) => b.price.compareTo(a.price));
    } else if (selectedsort.value == 'Stock: Low to High') {
      result.sort((a, b) => a.stock.compareTo(b.stock));
    } else if (selectedsort.value == 'Stock: High to Low') {
      result.sort((a, b) => b.stock.compareTo(a.stock));
    }

    filteredproducts.value = result;
  }

  // called when user types in search bar
  void onSearch(String query) {
    searchquery.value = query;
    applyfilter();
  }

  // called when user picks a sort option
  void onSort(String sort) {
    selectedsort.value = sort;
    applyfilter();
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
        imageurl =
            await productservice.uploadImage(selectedimage.value!);
      }

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