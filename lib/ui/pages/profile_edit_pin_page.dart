import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widget/buttons.dart';
import 'package:bank_sha/ui/widget/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({super.key});

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text('Edit Pin'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
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
                    title: 'Old PIN',
                    controller: oldPinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 16,
                  ), // NOTE : PASSWORD INPUT
                  CustomFormField(
                    title: 'New PIN',
                    controller: newPinController,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                      title: 'Update Now',
                      onPressed: () {
                        context.read<AuthBloc>().add(AuhtUpdatePin(
                            oldPinController.text, newPinController.text));
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
