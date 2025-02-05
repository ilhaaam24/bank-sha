import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:bank_sha/ui/widget/transfer_users_item.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                    style: greyTextStyle,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        filled: true,
                        fillColor: whiteColor,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(14))))
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Users',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Column(
                  children: [
                    TransferUsersItem(
                      name: 'Yonna Jie',
                      username: 'yoenna',
                      imgUrl: 'assets/img_friend1.png',
                      isVeriefied: true,
                    ),
                    TransferUsersItem(
                      name: 'John Hi',
                      username: 'jhi',
                      imgUrl: 'assets/img_friend2.png',
                      isVeriefied: false,
                    ),
                    TransferUsersItem(
                      name: 'Masayoshi',
                      username: 'form',
                      imgUrl: 'assets/img_friend3.png',
                      isVeriefied: false,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
