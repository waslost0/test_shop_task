import 'package:equatable/equatable.dart';

class ListParams extends Equatable {
  const ListParams({
    this.offset = 0,
    this.limit = 10,
    this.searchString,
  });

  final int offset;
  final int? limit;
  final String? searchString;

  @override
  List<Object?> get props => [
        offset,
        limit,
        searchString,
      ];
}
