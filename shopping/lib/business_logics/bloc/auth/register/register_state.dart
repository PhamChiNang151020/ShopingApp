// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object?> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterLoadSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String errMessage;
  final int? errCode;
  const RegisterFailure({
    required this.errMessage,
    this.errCode,
  });

  @override
  List<Object?> get props => [errMessage, errCode];
}

class RegisterSuccessfully extends RegisterState {}
