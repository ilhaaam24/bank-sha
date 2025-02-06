import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentItem extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;

  final bool isVeriefied;

  const TransferRecentItem(
      {super.key,
      required this.name,
      required this.username,
      required this.imgUrl,
      this.isVeriefied = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 23),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imgUrl),
              ),
            ),
            child: Image.asset(imgUrl),
          ),
          const SizedBox(
            width: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@$username',
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          if (isVeriefied)
            Row(children: [
              Image.asset('assets/ic_check.png', width: 16),
              const SizedBox(
                width: 4,
              ),
              Text(
                'Verified',
                style:
                    greenTextStyle.copyWith(fontWeight: medium, fontSize: 11),
              )
            ])
        ],
      ),
    );
  }
}
