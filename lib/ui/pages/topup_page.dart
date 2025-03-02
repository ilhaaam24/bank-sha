import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/payment_method/payment_method_bloc.dart';
import 'package:bank_sha/models/payment_method_model.dart';
import 'package:bank_sha/models/topup_form_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/topup_amount_page.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/topup_bank_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({super.key});

  @override
  State<TopupPage> createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  PaymentMethodModel? selectedPaymentMethod;
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
                  'Wallet',
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: semiBold),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      return Row(
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
                                state.user.name.toString(),
                                style: greyTextStyle.copyWith(fontSize: 12),
                              )
                            ],
                          )
                        ],
                      );
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Select Bank',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                BlocProvider(
                  create: (context) =>
                      PaymentMethodBloc()..add(PaymentMethodGet()),
                  child: BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
                    builder: (context, state) {
                      if (state is PaymentMethodSuccess) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: state.paymentMethods
                              .map((paymentMethod) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      (paymentMethod.id,);
                                      selectedPaymentMethod = paymentMethod;
                                    });
                                  },
                                  child: TopUpBankItem(
                                    paymentMethod: paymentMethod,
                                    isSelected: paymentMethod.id ==
                                        selectedPaymentMethod?.id,
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
            if (selectedPaymentMethod != null)
              CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TopupAmountPage(
                        data: TopupFormModel(
                            paymentMethodCode: selectedPaymentMethod!.code),
                      ),
                    ),
                  );
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
