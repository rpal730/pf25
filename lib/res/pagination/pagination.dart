import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
abstract class Pagination with _$Pagination {
  const Pagination._();

  const factory Pagination({
    @Default(1) int page,
    @Default(8) int limit,
    @Default(false) bool isLastPage,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

  Pagination nextPage(List newData) {
    final isLastPage = newData.length < limit;
    return copyWith(
      page: page + 1,
      isLastPage: isLastPage,
    );
  }

  int get skip => page * limit;
}



