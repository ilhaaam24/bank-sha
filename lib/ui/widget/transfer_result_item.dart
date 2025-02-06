import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultItem extends StatelessWidget {
  final String name;
  final String username;
  final String imgUrl;

  final bool isVeriefied;
  final bool isSelected;

  const TransferResultItem(
      {super.key,
      required this.name,
      required this.username,
      required this.imgUrl,
      this.isVeriefied = false,
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
          border: Border.all(color: isSelected ? blueColor : whiteColor)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/img_profile.png'))),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                      child: Icon(Icons.check_circle,
                          color: greenColor, size: 14))),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            name,
            style: blackTextStyle.copyWith(fontWeight: medium, fontSize: 18),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '@$username',
            style: blackTextStyle.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
