import 'package:bank_sha/models/sign_in_form_model.dart';
import 'package:bank_sha/models/sign_up_model.dart';
import 'package:bank_sha/models/user_edit_form_model.dart';
import 'package:bank_sha/models/user_model.dart';
import 'package:bank_sha/services/auth_services.dart';
import 'package:bank_sha/services/user_services.dart';
import 'package:bank_sha/services/wallet_services.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is AuthCheckEmail) {
        try {
          emit(AuthLoading());

          final res = await AuthServices().checkEmail(event.email);

          if (!res) {
            emit(AuthCheckEmailSuccess());
          } else {
            emit(const AuthFailed('Email already exist'));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthRegister) {
        try {
          emit(AuthLoading());

          final res = await AuthServices().register(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthLogin) {
        try {
          emit(AuthLoading());

          final res = await AuthServices().login(event.data);

          emit(AuthSuccess(res));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthGetCurrentUser) {
        try {
          emit(AuthLoading());
          final SignInFormModel data =
              await AuthServices().getCredentialFromLocal();
          final UserModel user = await AuthServices().login(data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthUpdateUser) {
        try {
          if (state is AuthSuccess) {
            await UserService().updateUser(event.data);
            final updateUser = (state as AuthSuccess).user.copyWith(
                  name: event.data.name,
                  username: event.data.username,
                  email: event.data.email,
                  password: event.data.password,
                );
            emit(AuthLoading());

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuhtUpdatePin) {
        try {
          if (state is AuthSuccess) {
            await WalletServices().updatePin(event.oldPin, event.newPin);
            final updateUser =
                (state as AuthSuccess).user.copyWith(pin: event.newPin);
            emit(AuthLoading());

            emit(AuthSuccess(updateUser));
          }
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuhtLogout) {
        try {
          emit(AuthLoading());
          await AuthServices().logout();
          emit(AuthInitial());
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
      if (event is AuthUpdateBalance) {
        if (state is AuthSuccess) {
          final user = (state as AuthSuccess).user;

          final updateUser = user.copyWith(balance: user.balance! + event.amount);

          emit(AuthSuccess(updateUser));
        }
      }
    });
  }
}
