import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final VoidCallback? onTap;
  const HomeServiceItem(
      {super.key, required this.title, required this.iconUrl, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 70,
            width: 70,
            margin: const EdgeInsets.only(bottom: 8),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Image.asset(
                iconUrl,
                width: 26,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(fontWeight: medium),
        )
      ],
    );
  }
}
