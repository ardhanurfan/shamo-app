import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamoapp/providers/auth_provider.dart';
import 'package:shamoapp/providers/product_provider.dart';
import 'package:shamoapp/providers/wishlist_provider.dart';

import 'ui/pages/home/main_page.dart';
import 'ui/pages/sign_in_page.dart';
import 'ui/pages/splash_page.dart';
import 'ui/pages/sign_up_page.dart';
import 'ui/pages/detail_chat.dart';
import 'ui/pages/edit_profile_page.dart';
import 'ui/pages/cart_page.dart';
import 'ui/pages/checkout_page.dart';
import 'ui/pages/checkout_success_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => WishlistProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/home': (context) => const MainPage(),
          '/detail-chat': (context) => const DetailChat(),
          '/edit-profile': (context) => const EditProfilePage(),
          '/cart': (context) => const CartPage(),
          '/checkout': (context) => const CheckoutPage(),
          '/checkout-success': (context) => const CheckoutSuccessPage(),
        },
      ),
    );
  }
}
