import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class splashPage extends StatelessWidget {
  const splashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Image.asset(
          'assets/img_logo_dark.png',
          width: 155,
          height: 50,
        ),
      ),
    );
  }
}
