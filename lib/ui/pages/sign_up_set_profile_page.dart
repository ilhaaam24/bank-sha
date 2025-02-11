import 'dart:convert';
import 'dart:io';

import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfilePage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetProfilePage({
    super.key,
    required this.data,
  });

  @override
  State<SignUpSetProfilePage> createState() => _SignUpSetProfilePageState();
}

class _SignUpSetProfilePageState extends State<SignUpSetProfilePage> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validatePin() {
    if (pinController.text.length < 6) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Join Us to Unlock\nYour Growth',
          style: blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  final image = await selectImage();
                  setState(() {
                    selectedImage = image;
                  });
                },
                child: Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: selectedImage == null
                          ? null
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(File(selectedImage!.path))),
                      shape: BoxShape.circle,
                      color: lightBackgroundColor),
                  child: selectedImage != null
                      ? null
                      : Center(
                          child: Image.asset(
                            'assets/ic_upload.png',
                            height: 32,
                            width: 32,
                          ),
                        ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                widget.data.name.toString(),
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFormField(
                title: 'Set PIN (6 digit number)',
                controller: pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validatePin()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpSetKtpPage(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage != null
                                  ? 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'
                                  : '',
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackbar(
                          context, "PIN harus terdiri dari 6 angka");
                    }
                  }),
            ],
          ),
        ),
      ],
    ));
  }
}
