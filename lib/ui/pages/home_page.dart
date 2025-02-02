import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      bottomNavigationBar: BottomAppBar(
        color: whiteColor,
        elevation: 0,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            elevation: 0,
            selectedItemColor: blueColor,
            unselectedItemColor: blackColor,
            showUnselectedLabels: true,
            unselectedLabelStyle:
                blackTextStyle.copyWith(fontSize: 10, fontWeight: medium),
            showSelectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_overview.png',
                  width: 20,
                  color: blueColor,
                ),
                label: 'Overview',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_history.png',
                  width: 20,
                ),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_statistic.png',
                  width: 20,
                ),
                label: 'Statistic',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/ic_reward.png',
                  width: 20,
                ),
                label: 'Reward',
              ),
            ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: purpleColor,
        shape: const StadiumBorder(),
        onPressed: () {},
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          buildProfile(),
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Howdy,',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'shaynahan',
                style:
                    blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              )
            ],
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage('assets/img_profile.png'))),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                      child: Icon(Icons.check_circle,
                          color: greenColor, size: 14))),
            ),
          )
        ],
      ),
    );
  }
}
