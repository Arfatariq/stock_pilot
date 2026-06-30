import 'package:flutter/material.dart';
import 'package:stock_pilot/views/auth_screens/login_screen.dart';

import 'package:stock_pilot/theme/app_colors.dart';
import 'package:stock_pilot/widgets/top_bar.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final phonenocontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
 bool _obscurePassword = true;

  @override
  void dispose() {
    emailcontroller.dispose();
    namecontroller.dispose();
    phonenocontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

                  const SizedBox(height: 10),

                  // heading
                  const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryDark,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Set up your workspace',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.primaryMid,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // name label
                  const Text(
                    'Name',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),

                  // name field
                  TextField(
                    controller: namecontroller,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 13),
                      prefixIcon: Icon(Icons.person_outline,
                          size: 18, color: Colors.grey.shade400),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // email label
                  const Text(
                    'Email',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),

                  // email field
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
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // phone label
                  const Text(
                    'Phone number',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),

                  // phone field
                  TextField(
                    controller: phonenocontroller,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: '03xx-xxxxxxx',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 13),
                      prefixIcon: Icon(Icons.phone_outlined,
                          size: 18, color: Colors.grey.shade400),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // password label
                  const Text(
                    'Password',
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                  const SizedBox(height: 6),

                  // password field
                  TextField(
                    controller: passwordcontroller,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: '••••••••',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade400, fontSize: 13),
                      prefixIcon: Icon(Icons.lock_outline,
                          size: 18, color: Colors.grey.shade400),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 18,
                          color: Colors.grey.shade400,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                      
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        'Create account',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account? ',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade500),
                      ),
                      GestureDetector(
                        onTap: () {
                             Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>  LoginScreen(),
      ),
    );
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}