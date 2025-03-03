import 'package:bank_sha/blocs/user/user_bloc.dart';
import 'package:bank_sha/models/transfer_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/transfer_amount_page.dart';
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
                      selectedUser = null;
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
          ],
        ),
      ),
      floatingActionButton: selectedUser == null
          ? Container()
          : Container(
              margin: const EdgeInsets.all(24),
              child: CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TransferAmountPage(
                                data: TransferFormModel(
                                    sendTo: selectedUser!.username))));
                  }),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget buildRecentUsers() {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
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
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Column(
                      children: state.users.map((user) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TransferAmountPage(
                                      data: TransferFormModel(
                                          sendTo: user.username))));
                        },
                        child: TransferRecentItem(
                          user: user,
                          isSelected: user.id == selectedUser?.id,
                        ));
                  }).toList());
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        ));
  }

  Widget buildResultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Result Users',
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is UserSuccess) {
                  return Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 20,
                    children: state.users.map((user) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedUser = user;
                            });
                          },
                          child: TransferResultItem(
                            user: user,
                            isSelected: user.id == selectedUser?.id,
                          ));
                    }).toList(),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          )
        ],
      ),
    );
  }
}
