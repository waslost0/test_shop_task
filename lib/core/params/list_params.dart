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

  ListParams copyWith({
    int? offset,
    int? limit,
    String? searchString,
  }) {
    return ListParams(
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      searchString: searchString ?? this.searchString,
    );
  }
}
