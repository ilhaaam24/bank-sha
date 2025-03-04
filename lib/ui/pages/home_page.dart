import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/blocs/transaction/transaction_bloc.dart';
import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/home_service_item.dart';
import 'package:bank_sha/ui/widget/home_tips_item.dart';
import 'package:bank_sha/ui/widget/home_transaction_item.dart';
import 'package:bank_sha/ui/widget/home_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          buildProfile(context),
          buildWalletCard(),
          buildLevel(),
          buildServices(context),
          buildLatestTracsaction(),
          buildSendAgain(),
          buildTips(context)
        ],
      ),
    );
  }

  Widget buildProfile(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
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
                      state.user.name.toString(),
                      style: blackTextStyle.copyWith(
                          fontSize: 20, fontWeight: semiBold),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: state.user.profilePicture != ''
                                ? NetworkImage(state.user.profilePicture!)
                                    as ImageProvider
                                : const AssetImage('assets/img_profile.png'))),
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
                  ),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Widget buildWalletCard() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/img_bg_card.png'),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shayna Hanna',
                  style:
                      whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 28,
                ),
                Text(
                  '**** **** **** ${state.user.cardNumber!.substring(12)}',
                  style: whiteTextStyle.copyWith(
                      fontSize: 18, fontWeight: medium, letterSpacing: 5),
                ),
                const SizedBox(
                  height: 21,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle,
                ),
                Text(
                  formatCurrency(state.user.balance!),
                  style: whiteTextStyle.copyWith(
                      fontSize: 24, fontWeight: semiBold),
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
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
                'of ${formatCurrency(20000)}',
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

  Widget buildServices(BuildContext context) {
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
                onTap: () {
                  Navigator.pushNamed(context, '/topup');
                },
              ),
              HomeServiceItem(
                title: 'Send',
                iconUrl: 'assets/ic_send.png',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                title: 'Withdraw',
                iconUrl: 'assets/ic_withdraw.png',
                onTap: () {},
              ),
              HomeServiceItem(
                title: 'More',
                iconUrl: 'assets/ic_more.png',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const MoreService());
                },
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
            child: BlocProvider(
              create: (context) => TransactionBloc()..add(TransactionGet()),
              child: BlocBuilder<TransactionBloc, TransactionState>(
                builder: (context, state) {
                  if (state is TransactionSuccess) {
                    return Column(
                        children: state.transactions
                            .map((transaction) => HomeLatestTransactionItem(
                                transaction: transaction))
                            .toList());
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Row(
                    children: state.users
                        .map((user) => HomeUserItem(
                              name: user.name!.split(' ')[0],
                              imageUrl: user.profilePicture!,
                            ))
                        .toList(),
                  );
                }
                return const SizedBox();
              },
            ),
          )
        ],
      ),
    );
  }

  Widget buildTips(BuildContext context) {
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
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                runSpacing: 16,
                children: [
                  HomeTipsItem(
                      imageUrl: 'assets/img_tips1.png',
                      title: 'Best tips for using a credit card',
                      url: ''),
                  HomeTipsItem(
                      imageUrl: 'assets/img_tips2.png',
                      title: 'Spot the good pie of finance model',
                      url: 'https://www.google.com/'),
                  HomeTipsItem(
                      imageUrl: 'assets/img_tips3.png',
                      title: 'Great hack to get better advices',
                      url: 'https://www.google.com/'),
                  HomeTipsItem(
                      imageUrl: 'assets/img_tips4.png',
                      title: 'Save more penny buy this instead',
                      url: 'https://www.google.com/'),
                ]),
          ),
        ],
      ),
    );
  }
}

class MoreService extends StatelessWidget {
  const MoreService({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.all(30),
        height: 326,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: lightBackgroundColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 13,
            ),
            Wrap(
              spacing: 29,
              runSpacing: 29,
              children: [
                HomeServiceItem(
                  title: 'Data',
                  iconUrl: 'assets/ic_product_data.png',
                  onTap: () {
                    Navigator.pushNamed(context, '/data-provider');
                  },
                ),
                HomeServiceItem(
                  title: 'Data',
                  iconUrl: 'assets/ic_product_water.png',
                  onTap: () {},
                ),
                HomeServiceItem(
                  title: 'Stream',
                  iconUrl: 'assets/ic_product_stream.png',
                  onTap: () {},
                ),
                HomeServiceItem(
                  title: 'Moview',
                  iconUrl: 'assets/ic_product_movie.png',
                  onTap: () {},
                ),
                HomeServiceItem(
                  title: 'Food',
                  iconUrl: 'assets/ic_product_food.png',
                  onTap: () {},
                ),
                HomeServiceItem(
                  title: 'Travel',
                  iconUrl: 'assets/ic_product_travel.png',
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
