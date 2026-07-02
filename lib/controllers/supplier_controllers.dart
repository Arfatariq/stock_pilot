import 'package:get/get.dart';
import 'package:stock_pilot/models/supplier_model.dart';

import 'package:stock_pilot/services/supplier_services.dart';

class SupplierController extends GetxController {
  final supplierservice = SupplierService();

  var suppliers = <SupplierModel>[].obs;
  var filteredsuppliers = <SupplierModel>[].obs;
  var isloading = false.obs;
  var isadding = false.obs;

  var searchquery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSuppliers();
  }

  Future<void> fetchSuppliers() async {
    isloading.value = true;
    try {
      final result = await supplierservice.getSuppliers();
      suppliers.value = result;
      filteredsuppliers.value = result;
    } catch (e) {
      print('fetch suppliers error: $e');
    }
    isloading.value = false;
  }

  // search suppliers by name or contact
  void onSearch(String query) {
    searchquery.value = query;
    if (query.isEmpty) {
      filteredsuppliers.value = suppliers;
      return;
    }
    filteredsuppliers.value = suppliers.where((s) {
      return s.name.toLowerCase().contains(query.toLowerCase()) ||
          s.contact.toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  // add supplier
  Future<void> addSupplier({
    required String name,
    required String contact,
    required String phone,
    required String email,
    required String address,
  }) async {
    if (name.isEmpty) {
      Get.snackbar('Error', 'Supplier name is required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isadding.value = true;

    try {
      final supplier = SupplierModel(
        id: '',
        name: name,
        contact: contact,
        phone: phone,
        email: email,
        address: address,
        createdat: '',
      );

      await supplierservice.addSupplier(supplier);
      await fetchSuppliers();
      Get.back();

      Get.snackbar('Done', 'Supplier added successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('add supplier error: $e');
      Get.snackbar('Error', 'Failed to add supplier',
          snackPosition: SnackPosition.BOTTOM);
    }

    isadding.value = false;
  }

  // update supplier
  Future<void> updateSupplier({
    required String id,
    required String name,
    required String contact,
    required String phone,
    required String email,
    required String address,
  }) async {
    if (name.isEmpty) {
      Get.snackbar('Error', 'Supplier name is required',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isadding.value = true;

    try {
      final supplier = SupplierModel(
        id: id,
        name: name,
        contact: contact,
        phone: phone,
        email: email,
        address: address,
        createdat: '',
      );

      await supplierservice.updateSupplier(supplier);
      await fetchSuppliers();
      Get.back();

      Get.snackbar('Done', 'Supplier updated successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('update supplier error: $e');
      Get.snackbar('Error', 'Failed to update supplier',
          snackPosition: SnackPosition.BOTTOM);
    }

    isadding.value = false;
  }

  // delete supplier with confirmation
  Future<void> deleteSupplier(String id) async {
    try {
      await supplierservice.deleteSupplier(id);
      await fetchSuppliers();

      Get.snackbar('Done', 'Supplier deleted',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      print('delete supplier error: $e');
      Get.snackbar('Error', 'Failed to delete supplier',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}