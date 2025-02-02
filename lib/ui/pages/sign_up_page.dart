import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightBackgroundColor,
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
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : FULL NAME INPUT
                  const CustomFormField(title: 'Full Name'),
                  // NOTE : EMAIL INPUT
                  const SizedBox(
                    height: 16,
                  ), // NOTE : PASSWORD INPUT
                  const CustomFormField(title: 'Email Address'),
                  const SizedBox(
                    height: 16,
                  ), // NOTE : PASSWORD INPUT
                  const CustomFormField(
                    title: 'Password',
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                      title: 'Continue',
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-up-set-profile');
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                }),
          ],
        ));
  }
}
