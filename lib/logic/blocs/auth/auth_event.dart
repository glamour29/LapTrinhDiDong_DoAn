part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class LoginEvent extends AuthEvent {
  final OAuth oAuth;

  const LoginEvent({required this.oAuth});

  @override
  List<Object> get props => [oAuth];
}
