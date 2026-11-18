import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../routes/app_routes.dart';

class AuthController extends GetxController {
  static const String nim = '124240058'; // GANTI dengan NIM kamu
  static const String _password = '123';

  final usernameC = TextEditingController();
  final passwordC = TextEditingController();
  final RxString _username = ''.obs;
  String get username => _username.value;

  @override
  void onInit() {
    _loadUsername();
    super.onInit();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    _username.value = prefs.getString('username') ?? '';
  }

  Future<void> login() async {
    final u = usernameC.text.trim();
    final p = passwordC.text.trim();
    if (u == nim && p == _password) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('username', u);
      _username.value = u;
      usernameC.clear();
      passwordC.clear();
      Get.offAllNamed(AppRoutes.root);
    } else {
      Get.snackbar('Login gagal', 'Username atau password salah',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    _username.value = '';
    Get.offAllNamed(AppRoutes.login);
  }
}