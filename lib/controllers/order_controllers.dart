import 'dart:io';

import 'package:get/get.dart';
import 'package:stock_pilot/models/order_model.dart';

import 'package:stock_pilot/services/order_services.dart';

class OrderController extends GetxController {
  final orderservice = OrderService();

  var orders = <OrderModel>[].obs;
  var isloading = false.obs;
  var isadding = false.obs;

    var selectedimage = Rxn<File>();

  void setImage(File image) {
    selectedimage.value = image;
  }
  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  // fetch all orders from supabase
  Future<void> fetchOrders() async {
    isloading.value = true;
    try {
      final result = await orderservice.getOrders();
      orders.value = result;
    } catch (e) {
      print('fetch orders error: $e');
    }
    isloading.value = false;
  }

  // add new order
  Future<void> addOrder({
    required String productname,
    required String description,
    required String price,
    required String quantity,
    required String supplier,
    String status = 'Pending',
  }) async {

    // basic validation
    if (productname.isEmpty || price.isEmpty || quantity.isEmpty) {
      Get.snackbar('Error', 'Please fill in all required fields',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isadding.value = true;

    try {
      final order = OrderModel(
        id: '',
        productname: productname,
        description: description,
        price: double.tryParse(price) ?? 0,
        quantity: int.tryParse(quantity) ?? 0,
        supplier: supplier,
        status: status,
        createdat: '', productName: '', createdAt: '',
      );

      await orderservice.addOrder(order);
      await fetchOrders();
      Get.back();

      Get.snackbar('Done', 'Order added successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('add order error: $e');
      Get.snackbar('Error', 'Failed to add order',
          snackPosition: SnackPosition.BOTTOM);
    }

    isadding.value = false;
  }
}