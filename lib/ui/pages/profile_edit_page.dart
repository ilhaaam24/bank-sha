import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final usernameController = TextEditingController(text: '');
  final nameController = TextEditingController(text: '');
  final emailnameController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      usernameController.text = authState.user.username!;
      nameController.text = authState.user.name!;
      emailnameController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

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
              CustomFormField(
                title: 'Username',
                controller: usernameController,
              ),
              const SizedBox(
                height: 16,
              ), // NOTE : PASSWORD INPUT
              CustomFormField(
                title: 'Full Name',
                controller: nameController,
              ),
              const SizedBox(
                height: 16,
              ), // NOTE : PASSWORD INPUT
              CustomFormField(
                title: 'Email Address',
                controller: emailnameController,
              ),
              const SizedBox(
                height: 16,
              ), // NOTE : PASSWORD INPUT
              CustomFormField(
                title: 'Password',
                obscureText: true,
                controller: passwordController,
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
