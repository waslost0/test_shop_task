import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_shop_task/core/utils/json_converter.dart';
import 'package:test_shop_task/features/catalog/domain/entities/category_entity.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int categoryId,
    required String title,
    required int createdAt,
    required int updatedAt,
    @BoolJsonConverter() @Default(true) bool isPublic,
    @BoolJsonConverter() @Default(false) bool hasSubcategories,
    int? parentCategoryId,
    String? description,
    String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension UserX on Category {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      title: title,
      createdAt: createdAt,
      updatedAt: updatedAt,
      icon: icon,
      description: description,
      hasSubcategories: hasSubcategories,
      isPublic: isPublic,
      parentCategoryId: parentCategoryId,
    );
  }
}
