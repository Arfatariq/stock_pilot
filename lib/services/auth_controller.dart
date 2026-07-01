import 'package:get/get.dart';

import 'package:stock_pilot/services/auth_services.dart';

class AuthController extends GetxController {
  final authservice = AuthService();

  // these are observable variables
  // when they change the UI updates automatically
  var isloading = false.obs;
  var errormessage = ''.obs;

  // login method
  Future<void> login(String email, String password) async {
    // clear old error first
    errormessage.value = '';

    // basic check before calling supabase
    if (email.isEmpty || password.isEmpty) {
      errormessage.value = 'Please fill in all fields';
      return;
    }

    isloading.value = true;

    try {
      final response = await authservice.login(email, password);

      if (response.user != null) {
        // login worked — go to dashboard
        Get.offAllNamed('/dashboard');
      }
    } catch (e) {
      errormessage.value = 'Invalid email or password';
    }

    isloading.value = false;
  }

  // signup method
  Future<void> signup(
      String name, String phone, String email, String password) async {
    errormessage.value = '';

    if (name.isEmpty || phone.isEmpty ||
        email.isEmpty || password.isEmpty) {
      errormessage.value = 'Please fill in all fields';
      return;
    }

    isloading.value = true;

    try {
      final response =
          await authservice.signup(name, phone, email, password);

      if (response.user != null) {
        // signup worked — go to dashboard
        Get.offAllNamed('/dashboard');
      }
    } catch (e) {
      errormessage.value = 'Signup failed. Try again';
    }

    isloading.value = false;
  }
}