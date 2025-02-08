import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/topup_bank_item.dart';
import 'package:flutter/material.dart';

class DataProviderPage extends StatelessWidget {
  const DataProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('Top Up'),
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
                  'Beli Data',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/img_wallet.png',
                      width: 80,
                      height: 55,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '8008 2208 1996',
                          style: blackTextStyle.copyWith(
                              fontWeight: medium, fontSize: 16),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Balance: ${formatCurrency(18000000)}',
                          style: greyTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Provider',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TopUpBankItem(
                        bankName: 'Telkomsel',
                        imageUrl: 'assets/img_provider_telkomsel.png',
                        time: 'Available'),
                    TopUpBankItem(
                        bankName: 'Indosat Ooredoo',
                        imageUrl: 'assets/img_provider_indosat.png',
                        time: '50 mins'),
                    TopUpBankItem(
                        bankName: 'Singtel ID',
                        imageUrl: 'assets/img_provider_singtel.png',
                        time: '50 mins'),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomFilledButton(
              title: 'Continue',
              onPressed: () {
                Navigator.pushNamed(context, '/data-package');
              },
            ),
            const SizedBox(
              height: 57,
            )
          ],
        ),
      ),
    );
  }
}
