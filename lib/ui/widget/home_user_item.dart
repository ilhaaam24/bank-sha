import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  const HomeUserItem({super.key, required this.imageUrl, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 105,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(
        right: 17,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
              color: whiteColor,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: imageUrl == ''
                      ? const AssetImage('assets/img_profile.png')
                      : NetworkImage(imageUrl),
                  fit: BoxFit.cover),
            ),
          ),
          Text('@$name',
              style: blackTextStyle.copyWith(fontSize: 12, fontWeight: medium))
        ],
      ),
    );
  }
}
