import 'package:bank_sha/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomFilledButton(
      {super.key,
      required this.title,
      this.width = double.infinity,
      this.height = 50,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              backgroundColor: purpleColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56))),
          child: Text(
            title,
            style: whiteTextStyle.copyWith(fontSize: 16, fontWeight: semiBold),
          )),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;

  const CustomTextButton(
      {super.key,
      required this.title,
      this.width = double.infinity,
      this.height = 50,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(56))),
          child: Text(
            title,
            style: greyTextStyle.copyWith(
              fontSize: 16,
            ),
          )),
    );
  }
}

class CustomInputButton extends StatelessWidget {
  final String number;
  final VoidCallback? onTap;

  const CustomInputButton({super.key, required this.number, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(shape: BoxShape.circle, color: greyColor),
        child: Center(
          child: Text(
            number,
            style: whiteTextStyle.copyWith(fontSize: 22, fontWeight: semiBold),
          ),
        ),
      ),
    );
  }
}
