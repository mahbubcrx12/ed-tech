import 'package:ed_tech/pages/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password, // Fix: Use the correct parameter here
      );

      // Login successful
      print('Login successful!');
      // Perform additional actions after successful login

      Get.offAll(() =>
          DashBoardScreen()); // Navigate to DashBoardScreen after successful login
    } catch (e) {
      // Handle login errors here
      print('Error during login: ${e.toString()}');

      if (e is FirebaseAuthException && e.code == 'invalid-email') {
        Get.snackbar(
            'Email formatted badly', 'Enter a properly formatted email',
            backgroundColor: Colors.red);
      }
      if (e is FirebaseAuthException && e.code == 'user-not-found') {
        Get.snackbar('Email not found', 'Enter valid email or sign up',
            backgroundColor: Colors.red);
      }
      if (e is FirebaseAuthException && e.code == 'wrong-password') {
        Get.snackbar('Wrong Password', 'Enter the correct password',
            backgroundColor: Colors.red);
      }
    }
  }
}
