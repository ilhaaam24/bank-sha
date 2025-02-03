import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final String title;
  final String iconUrl;
  final String time;
  final String amount;

  const HomeLatestTransactionItem(
      {super.key,
      required this.title,
      required this.iconUrl,
      required this.time,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            height: 48,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              Text(
                time,
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Text(
            amount,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          )
        ],
      ),
    );
  }
}
