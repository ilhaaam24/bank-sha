import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';

class TopupAmountPage extends StatefulWidget {
  const TopupAmountPage({super.key});

  @override
  State<TopupAmountPage> createState() => _TopupAmountPageState();
}

class _TopupAmountPageState extends State<TopupAmountPage> {
  final TextEditingController pinController =
      TextEditingController(text: 'Rp  ');

  addNumber(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
    if (pinController.text == '123123') {
      Navigator.pop(context, true);
    }
  }

  deleteNumber() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total Amount',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  enabled: false,
                  controller: pinController,
                  style: whiteTextStyle.copyWith(
                      fontSize: 36, fontWeight: medium, letterSpacing: 6),
                  showCursor: false,
                  decoration: InputDecoration(
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
                  InputButton(
                    number: '1',
                    onTap: () {
                      addNumber('1');
                    },
                  ),
                  InputButton(
                    number: '2',
                    onTap: () {
                      addNumber('2');
                    },
                  ),
                  InputButton(
                    number: '3',
                    onTap: () {
                      addNumber('3');
                    },
                  ),
                  InputButton(
                    number: '4',
                    onTap: () {
                      addNumber('4');
                    },
                  ),
                  InputButton(
                    number: '5',
                    onTap: () {
                      addNumber('5');
                    },
                  ),
                  InputButton(
                    number: '6',
                    onTap: () {
                      addNumber('6');
                    },
                  ),
                  InputButton(
                    number: '7',
                    onTap: () {
                      addNumber('7');
                    },
                  ),
                  InputButton(
                    number: '8',
                    onTap: () {
                      addNumber('8');
                    },
                  ),
                  InputButton(
                    number: '9',
                    onTap: () {
                      addNumber('9');
                    },
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  InputButton(
                    number: '0',
                    onTap: () {
                      addNumber('0');
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
                title: 'Checkout Now',
                onPressed: () {
                  Navigator.pushNamed(context, '/topup-success');
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
      ),
    );
  }
}
