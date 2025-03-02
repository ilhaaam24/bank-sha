part of 'topup_bloc.dart';

sealed class TopupState extends Equatable {
  const TopupState();

  @override
  List<Object> get props => [];
}

final class TopupInitial extends TopupState {}

final class TopupLoading extends TopupState {}

final class TopupFailed extends TopupState {
  final String e;
  const TopupFailed(this.e);

  @override
  // TODO: implement props
  List<Object> get props => [e];
}

final class TopupSuccess extends TopupState {
  final String directUrl;

  const TopupSuccess(this.directUrl);
  @override
  // TODO: implement props
  List<Object> get props => [directUrl];
}
