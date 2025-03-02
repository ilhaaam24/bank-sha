import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:bank_sha/ui/widget/transfer_recent_item.dart';
import 'package:bank_sha/ui/widget/transfer_result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final usernameController = TextEditingController();
  UserModel? selectedUser;
  late UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    userBloc = context.read<UserBloc>()..add(UserGetrecent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('Transfer'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 16),
                ),
                const SizedBox(
                  height: 14,
                ),
                CustomFormField(
                  title: 'by username',
                  isShowTitle: false,
                  controller: usernameController,
                  onFieldSubmitted: (value) {
                    if (value.isNotEmpty) {
                      userBloc.add(UserGetByUsername(value));
                    } else {
                      userBloc.add(UserGetrecent());
                    }
                    setState(() {});
                  },
                )
              ],
            ),
            usernameController.text.isEmpty
                ? buildRecentUsers()
                : buildResultUsers(),
            const SizedBox(
              height: 274,
            ),
            CustomFilledButton(
                title: 'Continue',
                onPressed: () {
                  Navigator.pushNamed(context, '/transfer-amount');
                }),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recent Users',
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              const SizedBox(
                height: 14,
              ),
              const Column(
                children: [
                  TransferRecentItem(
                    name: 'Yonna Jie',
                    username: 'yoenna',
                    imgUrl: 'assets/img_friend1.png',
                    isVeriefied: true,
                  ),
                  TransferRecentItem(
                    name: 'John Hi',
                    username: 'jhi',
                    imgUrl: 'assets/img_friend2.png',
                    isVeriefied: false,
                  ),
                  TransferRecentItem(
                    name: 'Masayoshi',
                    username: 'form',
                    imgUrl: 'assets/img_friend3.png',
                    isVeriefied: false,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const SizedBox(
            width: double.infinity,
            child: Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 20,
              children: [
                TransferResultItem(
                  name: 'Yonna Jie',
                  username: 'yoenna',
                  imgUrl: 'assets/img_friend1.png',
                  isVeriefied: true,
                ),
                TransferResultItem(
                  name: 'Yonne Ka',
                  username: 'yoenyu',
                  imgUrl: 'assets/img_friend2.png',
                  isVeriefied: true,
                ),
                TransferResultItem(
                  name: 'Masayoshi',
                  username: 'form',
                  imgUrl: 'assets/img_friend3.png',
                  isVeriefied: true,
                ),
                TransferResultItem(
                  name: 'Yonna Jie',
                  username: 'yoenna',
                  imgUrl: 'assets/img_friend4.png',
                  isVeriefied: true,
                  isSelected: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
