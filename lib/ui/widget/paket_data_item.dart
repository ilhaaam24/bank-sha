import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class PaketDataItem extends StatelessWidget {
  final String kuota;
  final int price;
  final bool isSelected;
  const PaketDataItem(
      {super.key,
      required this.kuota,
      required this.price,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width * 0.42,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 13),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: isSelected ? blueColor : whiteColor, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kuota,
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            formatCurrency(price),
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
