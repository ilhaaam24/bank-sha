import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // menggunakan final karena lebih aman karena imutable
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validateName() {
    if (nameController.text.isEmpty) {
      return true;
    }
    return false;
  }

  bool validateEmail() {
    if (emailController.text.isEmpty) {
      return true;
    }
    return false;
  }

  bool validatePassword() {
    if (passwordController.text.isEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          showCustomSnackbar(context, state.e);
        }

        if (state is AuthCheckEmailSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignUpSetProfilePage(
                      data: SignUpFormModel(
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text))));
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
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
              style:
                  blackTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // NOTE : FULL NAME INPUT
                  CustomFormField(
                    title: 'Full Name',
                    controller: nameController,
                  ),
                  // NOTE : EMAIL INPUT
                  const SizedBox(
                    height: 16,
                  ), // NOTE : PASSWORD INPUT
                  CustomFormField(
                    title: 'Email Address',
                    controller: emailController,
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
                      title: 'Continue',
                      onPressed: () {
                        if (validateName()) {
                          showCustomSnackbar(
                              context, 'Full Name cannot be empty');
                        } else if (validateEmail()) {
                          showCustomSnackbar(context, 'Email cannot be empty');
                        } else if (validatePassword()) {
                          showCustomSnackbar(
                              context, 'Password cannot be empty');
                        } else {
                          context
                              .read<AuthBloc>()
                              .add(AuthCheckEmail(emailController.text));
                        }
                      }),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                }),
          ],
        );
      },
    ));
  }
}
