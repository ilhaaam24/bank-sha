import 'package:bank_sha/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
                items: [
                  Image.asset(
                    'assets/img_onboarding1.png',
                    height: 331,
                  ),
                  Image.asset(
                    'assets/img_onboarding2.png',
                    height: 331,
                  ),
                  Image.asset(
                    'assets/img_onboarding3.png',
                    height: 331,
                  ),
                ],
                options: CarouselOptions(
                    height: 331,
                    enableInfiniteScroll: false,
                    viewportFraction: 1)),
            const SizedBox(
              height: 80,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    'Grow Your\nFinancial Today',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    'Our system is helping you to\nachieve a better goal',
                    style: greyTextStyle.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: blueColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: lightBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 12,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: lightBackgroundColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: purpleColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(56))),
                            child: Text(
                              'Continue',
                              style: whiteTextStyle.copyWith(
                                  fontSize: 16, fontWeight: semiBold),
                            )),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
