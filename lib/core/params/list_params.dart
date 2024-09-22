import 'package:equatable/equatable.dart';

class ListParams extends Equatable {
  const ListParams({
    this.offset = 0,
    this.limit = 10,
  });

  final int offset;
  final int? limit;

  @override
  List<Object?> get props => [
        offset,
        limit,
      ];
}
