// register_controller.dart

import 'package:ed_tech/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isObscure = true;
  bool isConfirmPasswordObscure = true;

  RxBool isLoading = false.obs;

  // Getter method to access isLoading from outside
  bool get isLoadingValue => isLoading.value;

  Future<void> signUp(String email, String password) async {
    try {
      print('pppppppppppppppppppppppppppppp');
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('qqqqqqqqqqqqqqqqqqqq===>$email $password');
      if (userCredential.user != null) {
        Get.to(() => LoginPage());
        // Account creation successful
        print('Account created successfully!');
        // Additional actions after successful sign-up
      } else {
        // Account creation failed
        print('Account creation failed.');
      }
    } on FirebaseAuthException catch (e) {
      // Handle sign-up errors here
      if (e.code == 'invalid-email') {
        Get.snackbar('Invalid Email formation', 'Enter valid email',
            backgroundColor: Colors.red);
      } else if (e.code == 'weak-password') {
        Get.snackbar('Password is too short', 'Enter at least 6 digit',
            backgroundColor: Colors.red);
      } else {
        Get.snackbar("error", "Something Wrong");
      }
    } catch (e) {
      // Handle generic errors here
      print('Error during account creation: ${e.toString()}');
    }
  }
}
