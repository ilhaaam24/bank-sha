import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';

class SignUpSetKtpPage extends StatelessWidget {
  const SignUpSetKtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        Container(
            height: 50,
            width: 155,
            margin: const EdgeInsets.only(top: 100, bottom: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img_logo_light.png')),
            )),
        Text(
          'Join Us to Unlock\nYour Growth',
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: lightBackgroundColor),
                child: Center(
                  child: Image.asset(
                    'assets/ic_upload.png',
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
              // Container(
              //   height: 120,
              //   width: 120,
              //   decoration: BoxDecoration(
              //       image: const DecorationImage(
              //           fit: BoxFit.cover,
              //           image: AssetImage('assets/img_profile.png')),
              //       shape: BoxShape.circle,
              //       color: lightBackgroundColor),
              // ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Passport/ID Card',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              ),

              const SizedBox(
                height: 50,
              ),
              CustomFilledButton(title: 'Continue', onPressed: () {}),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        CustomTextButton(
          title: 'Skip for Now',
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up-success');
          },
        )
      ],
    ));
  }
}
