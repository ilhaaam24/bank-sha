import 'dart:io';

import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetKtpPage extends StatefulWidget {
  final SignUpFormModel data;

  const SignUpSetKtpPage({super.key, required this.data});

  @override
  State<SignUpSetKtpPage> createState() => _SignUpSetKtpPageState();
}

class _SignUpSetKtpPageState extends State<SignUpSetKtpPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
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
              // Container(
              //   height: 120,
              //   width: 120,
              //   decoration: BoxDecoration(
              //       image: const DecorationImage(
              //           fit: BoxFit.cover,
              //           image: AssetImage('assets/img_profile.png')),
              //       shape: BoxShape.circle,
              //       color: lightBackgroundColor),
              // ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Passport/ID Card',
                style:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
              ),

              const SizedBox(
                height: 50,
              ),
              CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    if (validate()) {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> sig))
                    } else {
                      showCustomSnackbar(context, "KTP Tidak Boleh Kosong");
                    }
                  }),
            ],
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        CustomTextButton(
          title: 'Skip for Now',
          onPressed: () {
            Navigator.pushNamed(context, '/sign-up-success');
          },
        )
      ],
    ));
  }
}
