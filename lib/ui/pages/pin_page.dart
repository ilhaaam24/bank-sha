import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController();

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
  }

  deletePin() {
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
                'Sha PIN',
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
                  obscuringCharacter: '*',
                  style: whiteTextStyle.copyWith(
                      fontSize: 36, fontWeight: medium, letterSpacing: 16),
                  obscureText: true,
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
                      addPin('1');
                    },
                  ),
                  InputButton(
                    number: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  InputButton(
                    number: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  InputButton(
                    number: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  InputButton(
                    number: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  InputButton(
                    number: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  InputButton(
                    number: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  InputButton(
                    number: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  InputButton(
                    number: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                  ),
                  InputButton(
                    number: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
