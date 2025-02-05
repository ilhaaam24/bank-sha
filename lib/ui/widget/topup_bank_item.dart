import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TopUpBankItem extends StatelessWidget {
  final String bankName;
  final String imageUrl;
  final String time;
  const TopUpBankItem(
      {super.key,
      required this.bankName,
      required this.imageUrl,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                bankName,
                style:
                    blackTextStyle.copyWith(fontWeight: medium, fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                time,
                style: greyTextStyle.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
