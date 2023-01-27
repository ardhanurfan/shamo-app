import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamoapp/providers/auth_provider.dart';
import 'package:shamoapp/providers/product_provider.dart';
import 'package:shamoapp/services/auth_service.dart';
import 'package:shamoapp/shared/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    final navigator = Navigator.of(context);
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    final String? token = await AuthService().getTokenPreference();
    if (token == null) {
      navigator.pushNamedAndRemoveUntil('/sign-in', (route) => false);
    } else {
      if (await authProvider.getUser(token: token)) {
        navigator.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        navigator.pushNamedAndRemoveUntil('/sign-in', (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
          child: Container(
        width: 130,
        height: 150,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image_splash.png'),
          ),
        ),
      )),
    );
  }
}
