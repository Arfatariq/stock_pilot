import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  // get the supabase client
  final supabase = Supabase.instance.client;

  Future<AuthResponse> signup(
      String name, String phone, String email, String password) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    if (response.user != null) {
      await supabase.from('profiles').insert({
        'id': response.user!.id,
        'name': name,
        'phone': phone,
      });
    }

    return response;
  }

  Future<AuthResponse> login(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    return response;
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
  }

  Session? getCurrentSession() {
    return supabase.auth.currentSession;
  }
}