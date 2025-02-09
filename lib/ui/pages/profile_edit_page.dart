import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('Edit Photo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          margin: const EdgeInsets.only(top: 40),
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomFormField(title: 'Username'),
              const SizedBox(
                height: 16,
              ), // NOTE : PASSWORD INPUT
              const CustomFormField(title: 'Full Name'),
              const SizedBox(
                height: 16,
              ), // NOTE : PASSWORD INPUT
              const CustomFormField(title: 'Email Address'),
              const SizedBox(
                height: 16,
              ), // NOTE : PASSWORD INPUT
              const CustomFormField(
                title: 'Password',
                obscureText: true,
              ),

              const SizedBox(
                height: 30,
              ),
              CustomFilledButton(
                  title: 'Update Now',
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/profile-edit-success', (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
