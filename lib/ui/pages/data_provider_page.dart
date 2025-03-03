import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/operator_card/operator_card_bloc.dart';
import 'package:bank_sha/models/operator_card_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/data_package_page.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/provider_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataProviderPage extends StatefulWidget {
  const DataProviderPage({super.key});

  @override
  State<DataProviderPage> createState() => _DataProviderPageState();
}

class _DataProviderPageState extends State<DataProviderPage> {
  OperatorCardModel? selectedOperatorCard;
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        if (state is AuthSuccess) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.user.cardNumber!.replaceAllMapped(
                                    RegExp(r".{4}"),
                                    (match) => "${match.group(0)}"),
                                style: blackTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                'Balance: ${formatCurrency(state.user.balance ?? 0)}',
                                style: greyTextStyle.copyWith(fontSize: 12),
                              )
                            ],
                          );
                        }
                        return Container();
                      },
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
                BlocProvider(
                  create: (context) =>
                      OperatorCardBloc()..add(OperatorCardGet()),
                  child: BlocBuilder<OperatorCardBloc, OperatorCardState>(
                    builder: (context, state) {
                      if (state is OperatorCardSuccess) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: state.operatorCards
                              .map((operatorCard) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedOperatorCard = operatorCard;
                                    });
                                  },
                                  child: ProviderItem(
                                    operatorCard: operatorCard,
                                    isSelected: operatorCard.id ==
                                        selectedOperatorCard?.id,
                                  )))
                              .toList(),
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: (selectedOperatorCard != null)
          ? Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DataPackagePage(
                              operatorCardModel: selectedOperatorCard!,
                            )),
                  );
                },
              ),
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
