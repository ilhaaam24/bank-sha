import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Text(
          'Halo Semuaaa',
          style: blackTextStyle.copyWith(fontSize: 30),
        )),
      ),
    );
  }
}
