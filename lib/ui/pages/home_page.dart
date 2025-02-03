import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/home_service_item.dart';
import 'package:bank_sha/ui/widget/home_tips_item.dart';
import 'package:bank_sha/ui/widget/home_transaction_item.dart';
import 'package:bank_sha/ui/widget/home_user_item.dart';
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
        elevation: 0,
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
          buildWalletCard(),
          buildLevel(),
          buildServices(),
          buildLatestTracsaction(),
          buildSendAgain(),
          buildTips()
        ],
      ),
    );
  }

  Widget buildProfile() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
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

  Widget buildWalletCard() {
    return Container(
      height: 220,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: AssetImage('assets/img_bg_card.png'), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shayna Hanna',
            style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
          ),
          const SizedBox(
            height: 28,
          ),
          Text(
            '1234 5678 9012 3456',
            style: whiteTextStyle.copyWith(
                fontSize: 18, fontWeight: medium, letterSpacing: 6),
          ),
          const SizedBox(
            height: 21,
          ),
          Text(
            'Balance',
            style: whiteTextStyle,
          ),
          Text(
            'Rp 12.500',
            style: whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
          )
        ],
      ),
    );
  }

  Widget buildLevel() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(fontWeight: medium),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(fontWeight: semiBold),
              ),
              Text(
                'of Rp 20.000',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(greenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ],
      ),
    );
  }

  Widget buildServices() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                title: 'Top Up',
                iconUrl: 'assets/ic_topup.png',
                onTap: () {},
              ),
              HomeServiceItem(
                title: 'Send',
                iconUrl: 'assets/ic_send.png',
                onTap: () {},
              ),
              HomeServiceItem(
                title: 'Withdraw',
                iconUrl: 'assets/ic_withdraw.png',
                onTap: () {},
              ),
              HomeServiceItem(
                title: 'More',
                iconUrl: 'assets/ic_more.png',
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildLatestTracsaction() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14),
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: const Column(
              children: [
                HomeLatestTransactionItem(
                    title: 'Top Up',
                    iconUrl: 'assets/ic_transaction_cat1.png',
                    time: 'Yesterday',
                    amount: '+ 450.000'),
                HomeLatestTransactionItem(
                    title: 'Cashback',
                    iconUrl: 'assets/ic_transaction_cat2.png',
                    time: 'Sep 11',
                    amount: '+ 22.000'),
                HomeLatestTransactionItem(
                    title: 'Withdraw',
                    iconUrl: 'assets/ic_transaction_cat3.png',
                    time: 'Sep 2',
                    amount: '- 5.000'),
                HomeLatestTransactionItem(
                    title: 'Transfer',
                    iconUrl: 'assets/ic_transaction_cat4.png',
                    time: 'Aug 27',
                    amount: '- 123.500'),
                HomeLatestTransactionItem(
                    title: 'Electric',
                    iconUrl: 'assets/ic_transaction_cat5.png',
                    time: 'Feb 18',
                    amount: '- 12.300.000'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSendAgain() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ), 
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeUserItem(
                    imageUrl: 'assets/img_friend1.png', name: 'yuanita'),
                HomeUserItem(imageUrl: 'assets/img_friend2.png', name: 'jani'),
                HomeUserItem(imageUrl: 'assets/img_friend3.png', name: 'urip'),
                HomeUserItem(imageUrl: 'assets/img_friend4.png', name: 'masa'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildTips() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(spacing: 17, runSpacing: 18, children: [
            HomeTipsItem(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/'),
            HomeTipsItem(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/'),
            HomeTipsItem(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/'),
            HomeTipsItem(
                imageUrl: 'assets/img_tips1.png',
                title: 'Best tips for using a credit card',
                url: 'https://www.google.com/'),
          ]),
        ],
      ),
    );
  }
}
