import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  CarouselSliderController carouselSliderController =
      CarouselSliderController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together'
  ];

  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that\nyou can adapt easier',
    'We will guide you to where\nyou wanted it too'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              carouselController: carouselSliderController,
              options: CarouselOptions(
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  height: 331,
                  enableInfiniteScroll: false,
                  viewportFraction: 1),
            ),
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
                    titles[currentIndex],
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
                    subtitles[currentIndex],
                    style: greyTextStyle.copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: currentIndex == 2 ? 38 : 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            CustomFilledButton(
                              title: 'Get Started',
                              height: 50,
                              width: double.infinity,
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/sign-up', (route) => false);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextButton(
                              title: 'Sign In',
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/sign-in', (route) => false);
                              },
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: currentIndex == 0
                                    ? blueColor
                                    : lightBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: currentIndex == 1
                                    ? blueColor
                                    : lightBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                              height: 12,
                              width: 12,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: currentIndex == 2
                                    ? blueColor
                                    : lightBackgroundColor,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const Spacer(),
                            CustomFilledButton(
                              title: 'Continue',
                              onPressed: () {
                                carouselSliderController.nextPage();
                              },
                              height: 50,
                              width: 150,
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
