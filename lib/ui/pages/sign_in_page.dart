import 'package:flutter/material.dart';
import 'package:bank_sha/shared/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

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
              'Sign In &\nGrow Your Finance',
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
                  // NOTE : EMAIL INPUT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email Address',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ), // NOTE : PASSWORD INPUT
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password',
                        style: blackTextStyle.copyWith(fontWeight: medium),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14))),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password',
                        style: blueTextStyle,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: purpleColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(56))),
                        child: Text(
                          'Sign In',
                          style: whiteTextStyle.copyWith(
                              fontSize: 16, fontWeight: semiBold),
                        )),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56))),
                  child: Text(
                    'Create New Account',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )),
            ),
          ],
        ));
  }
}
