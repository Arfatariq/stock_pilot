import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:stock_pilot/services/auth_controller.dart';
import 'package:stock_pilot/views/auth_screens/forget_password.dart';
import 'package:stock_pilot/views/auth_screens/signup_screen.dart';
import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/widgets/top_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // inject the controller
    final authcontroller = Get.put(AuthController());

    final emailcontroller = TextEditingController();
    final passwordcontroller = TextEditingController();
    bool obscurepassword = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopBar(),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 8),

                  const Text(
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Sign in to continue',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryMid,
                    ),
                  ),

                  const SizedBox(height: 32),

                  const Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 13, color: AppColors.primaryDark),
                  ),
                  const SizedBox(height: 6),
                  TextField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'you@company.com',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 13),
                      prefixIcon: Icon(Icons.mail_outline,
                          size: 18, color: Colors.grey.shade400),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  const Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 13, color: AppColors.primaryDark),
                  ),
                  const SizedBox(height: 6),

                  // password needs StatefulWidget for eye toggle
                  // we will handle this with a simple StatefulBuilder
                  StatefulBuilder(
                    builder: (context, setstate) {
                      return TextField(
                        controller: passwordcontroller,
                        obscureText: obscurepassword,
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade400, fontSize: 13),
                          prefixIcon: Icon(Icons.lock_outline,
                              size: 18, color: Colors.grey.shade400),
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurepassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              size: 18,
                              color: Colors.grey.shade400,
                            ),
                            onPressed: () {
                              setstate(() {
                                obscurepassword = !obscurepassword;
                              });
                            },
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: AppColors.primary, width: 1.5),
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Forgot password?',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.primary),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // error message — shows only when there is an error
                  Obx(() {
                    if (authcontroller.errormessage.value.isEmpty) {
                      return const SizedBox();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 14),
                      child: Text(
                        authcontroller.errormessage.value,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFFA32D2D),
                        ),
                      ),
                    );
                  }),

                  // sign in button
                  Obx(() {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: authcontroller.isloading.value
                            ? null
                            : () {
                                authcontroller.login(
                                  emailcontroller.text.trim(),
                                  passwordcontroller.text.trim(),
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          padding:
                              const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: authcontroller.isloading.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                      ),
                    );
                  }),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(
                          child: Divider(color: Colors.grey.shade300)),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          'or',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade400),
                        ),
                      ),
                      Expanded(
                          child: Divider(color: Colors.grey.shade300)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(vertical: 14),
                        side:
                            const BorderSide(color: AppColors.primary),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                            fontSize: 13, color: AppColors.primary),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Center(
                    child: Text(
                      'By signing in you agree to our terms of use',
                      style: TextStyle(
                          fontSize: 11, color: Colors.grey.shade400),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}