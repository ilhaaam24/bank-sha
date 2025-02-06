import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:bank_sha/ui/widget/paket_data_item.dart';
import 'package:flutter/material.dart';

class PaketDataPage extends StatelessWidget {
  const PaketDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paket Data'),
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
                  'Phone Number',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                const CustomFormField(
                  title: '+628',
                  isShowTitle: false,
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Package',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                const SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 20,
                    children: [
                      PaketDataItem(
                        kuota: '10GB',
                        price: '218.000',
                        isSelected: true,
                      ),
                      PaketDataItem(kuota: '25GB', price: '420.000'),
                      PaketDataItem(kuota: '40GB', price: '2.500.000'),
                      PaketDataItem(kuota: '99GB', price: '5.000.000'),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 274,
            ),
            CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                }),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
