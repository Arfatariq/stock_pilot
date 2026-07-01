import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_pilot/views/splash/splash_screen.dart';
import 'package:stock_pilot/views/auth_screens/login_screen.dart';
import 'package:stock_pilot/views/dashboard/dashboard_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://gpzqrmazxzppogdjtxaa.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwenFybWF6eHpwcG9nZGp0eGFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODI4Mjk4MTYsImV4cCI6MjA5ODQwNTgxNn0.DK_ByCIu3aV8MILkAlTaCAfgSrcBjmopMCLUQ-Ifoj0',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'StockPilot',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF534AB7),
        ),
      ),
      home: const SplashScreen(),
      // named routes
      getPages: [
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(name: '/dashboard', page: () => const DashboardScreen()),
      ],
    );
  }
}