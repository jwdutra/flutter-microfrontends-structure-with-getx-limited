import 'package:commons/commons.dart';

import 'user_entity.dart';

class AccessEntity extends Equatable {
  final String token;
  final int expiresIn;
  final UserEntity user;

  const AccessEntity({
    required this.token,
    required this.expiresIn,
    required this.user,
  });

  factory AccessEntity.fromJson(Map<String, dynamic> json) {
    return AccessEntity(
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int,
      user: UserEntity.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'expiresIn': expiresIn,
      'user': user.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        token,
        expiresIn,
        user,
      ];
}
