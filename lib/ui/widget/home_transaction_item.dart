import 'package:bank_sha/models/transaction_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const HomeLatestTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          // Image.network(
          //   transaction.transactionType!.thumbnail!,
          //   height: 48,
          //   width: 48,
          // ),
          Container(
              width: 48,
              height: 48,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                  image: DecorationImage(
                    image:
                        NetworkImage(transaction.transactionType!.thumbnail!),
                  ))),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                transaction.transactionType!.name!,
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              Text(
                DateFormat('MMMM yyyy').format(transaction.createdAt!),
                style: greyTextStyle.copyWith(fontSize: 12),
              ),
            ],
          ),
          const Spacer(),
          Text(
            formatCurrency(transaction.amount ?? 0,
                symbol:
                    transaction.transactionType!.action == 'cr' ? '+' : '-'),
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          )
        ],
      ),
    );
  }
}
