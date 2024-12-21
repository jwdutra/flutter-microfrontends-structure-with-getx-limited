import 'package:commons/commons.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final int idGrupo;
  final dynamic timeRemember;
  final String? telefone;
  final int idPlano;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.idGrupo,
    this.timeRemember,
    this.telefone,
    required this.idPlano,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      idGrupo: json['id_grupo'] as int,
      timeRemember: json['time_remember'] as dynamic,
      telefone: json['telefone'] as String,
      idPlano: json['id_plano'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'idGrupo': idGrupo,
      'timeRemember': timeRemember,
      'telefone': telefone,
      'idPlano': idPlano,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      idGrupo,
      timeRemember,
      telefone,
      idPlano,
    ];
  }
}
