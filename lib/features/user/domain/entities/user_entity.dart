import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String? name;
  final String? lastname;
  final String? avatar;
  final String? phone;
  final String? email;
  final int? dateOfBirth;

  const UserEntity({
    required this.id,
    this.email,
    this.name,
    this.lastname,
    this.avatar,
    this.phone,
    this.dateOfBirth,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        lastname,
        avatar,
        phone,
        dateOfBirth,
        email,
      ];
}
