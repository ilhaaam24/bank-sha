import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeTipsItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String url;

  const HomeTipsItem(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 176,
      width: MediaQuery.of(context).size.width * 0.428,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              style: blackTextStyle.copyWith(fontWeight: medium),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
