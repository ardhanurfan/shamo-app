import 'package:flutter/material.dart';

import 'ui/pages/home/main_page.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/detail_chat.dart';
import 'ui/pages/edit_profile_page.dart';
import 'ui/pages/cart_page.dart';
import 'ui/pages/product_page.dart';
import 'ui/pages/checkout_page.dart';
import 'ui/pages/checkout_success_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage(),
        '/detail-chat': (context) => DetailChat(),
        '/edit-profile': (context) => EditProfilePage(),
        '/product': (context) => ProductPage(),
        '/cart': (context) => CartPage(),
        '/checkout': (context) => CheckoutPage(),
        '/checkout-success': (context) => CheckoutSuccessPage(),
      },
    );
  }
}
