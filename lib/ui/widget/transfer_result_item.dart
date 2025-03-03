import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultItem extends StatelessWidget {
  final UserModel user;
  final bool isSelected;

  const TransferResultItem(
      {super.key, required this.user, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.42,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 13),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: isSelected ? blueColor : whiteColor, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: user.profilePicture == null
                        ? const AssetImage('assets/img_profile.png')
                        : NetworkImage(user.profilePicture!) as ImageProvider,
                    fit: BoxFit.cover)),
            child: user.verified == 1
                ? Align(
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
                  )
                : Container(),
          ),
          const SizedBox(
            height: 13,
          ),
          Text(
            user.name.toString(),
            style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '@${user.username!.split('@')[0]}',
            style: blackTextStyle.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
