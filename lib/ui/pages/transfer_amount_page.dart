import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/bloc/transfer_bloc.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TransferAmountPage extends StatefulWidget {
  final TransferFormModel data;
  const TransferAmountPage({super.key, required this.data});

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      // Remove all non-numeric characters (e.g., '.', ',', etc.)
      final numericText = text.replaceAll(RegExp(r'[^0-9]'), '');

      // Check if the numericText is not empty before parsing
      if (numericText.isNotEmpty) {
        final formattedText = NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(int.parse(numericText));

        // Update the controller value with the formatted text
        amountController.value = amountController.value.copyWith(
          text: formattedText,
        );
      } else {
        // If the text is empty, set it to '0'
        amountController.value = amountController.value.copyWith(
          text: '0',
        );
      }
    });
  }

  addAmount(String number) {
    setState(() {
      if (amountController.text == '0') {
        amountController.text = '';
      }
      amountController.text = amountController.text + number;
    });
  }

  deleteNumber() {
    setState(() {
      amountController.text =
          amountController.text.substring(0, amountController.text.length - 1);

      if (amountController.text == '') {
        amountController.text = '0';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: BlocProvider(
        create: (context) => TransferBloc(),
        child: BlocConsumer<TransferBloc, TransferState>(
          listener: (context, state) {
            if (state is TransferFailed) {
              showCustomSnackbar(context, state.e);
            }

            if (state is TransferSuccess) {
              context.read<AuthBloc>().add(AuthUpdateBalance(
                    int.parse(amountController.text.replaceAll('.', '')) * -1,
                  ));

              Navigator.pushNamedAndRemoveUntil(
                  context, '/transfer-success', (route) => false);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 58),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Amount',
                      style: whiteTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 72,
                    ),
                    SizedBox(
                      width: 250,
                      child: TextFormField(
                        enabled: false,
                        controller: amountController,
                        style: whiteTextStyle.copyWith(
                          fontSize: 36,
                          fontWeight: medium,
                        ),
                        showCursor: false,
                        decoration: InputDecoration(
                          prefixIcon: Text('Rp\t',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 36, fontWeight: semiBold)),
                          disabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: greyColor)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 66,
                    ),
                    Wrap(
                      spacing: 40,
                      runSpacing: 40,
                      children: [
                        CustomInputButton(
                          number: '1',
                          onTap: () {
                            addAmount('1');
                          },
                        ),
                        CustomInputButton(
                          number: '2',
                          onTap: () {
                            addAmount('2');
                          },
                        ),
                        CustomInputButton(
                          number: '3',
                          onTap: () {
                            addAmount('3');
                          },
                        ),
                        CustomInputButton(
                          number: '4',
                          onTap: () {
                            addAmount('4');
                          },
                        ),
                        CustomInputButton(
                          number: '5',
                          onTap: () {
                            addAmount('5');
                          },
                        ),
                        CustomInputButton(
                          number: '6',
                          onTap: () {
                            addAmount('6');
                          },
                        ),
                        CustomInputButton(
                          number: '7',
                          onTap: () {
                            addAmount('7');
                          },
                        ),
                        CustomInputButton(
                          number: '8',
                          onTap: () {
                            addAmount('8');
                          },
                        ),
                        CustomInputButton(
                          number: '9',
                          onTap: () {
                            addAmount('9');
                          },
                        ),
                        const SizedBox(
                          height: 60,
                          width: 60,
                        ),
                        CustomInputButton(
                          number: '0',
                          onTap: () {
                            addAmount('0');
                          },
                        ),
                        GestureDetector(
                          onTap: () {
                            deleteNumber();
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: greyColor),
                            child: Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomFilledButton(
                      title: 'Continue',
                      onPressed: () async {
                        if (await Navigator.pushNamed(context, '/pin') ==
                            true) {
                          final authstate = context.read<AuthBloc>().state;
                          String pin = '';
                          if (authstate is AuthSuccess) {
                            pin = authstate.user.pin!;
                          }

                          context.read<TransferBloc>().add(TransferPost(
                              widget.data.copyWith(
                                  pin: pin,
                                  amount: amountController.text
                                      .replaceAll('.', ''))));
                        }
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextButton(
                      title: 'Terms & Conditions',
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
