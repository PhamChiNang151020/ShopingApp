part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoadSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String errMessage;
  final int? errCode;

  const LoginFailure(this.errMessage, this.errCode);
  @override
  List<Object?> get props => [errMessage, errCode];
}
