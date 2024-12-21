import 'package:equatable/equatable.dart';

class AuthTokenEntity extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  final String? expiresIn;

  const AuthTokenEntity({
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        expiresIn,
      ];
}
