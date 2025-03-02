part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckEmail extends AuthEvent {
  final String email;

  const AuthCheckEmail(this.email);
  @override
  // TODO: implement props
  List<Object> get props => [email];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;

  const AuthRegister(this.data);

  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;

  const AuthLogin(this.data);

  @override
  List<Object> get props => [data];
}

class AuthGetCurrentUser extends AuthEvent {}

class AuthUpdateUser extends AuthEvent {
  final UserEditFormModel data;
  const AuthUpdateUser(this.data);

  @override
  List<Object> get props => [data];
}

class AuhtUpdatePin extends AuthEvent {
  final String oldPin, newPin;
  const AuhtUpdatePin(this.oldPin, this.newPin);

  @override
  // TODO: implement props
  List<Object> get props => [oldPin, newPin];
}

class AuhtLogout extends AuthEvent {}

class AuthUpdateBalance extends AuthEvent {
  final int amount;

  const AuthUpdateBalance(this.amount);
  @override
  // TODO: implement props
  List<Object> get props => [amount];
}
