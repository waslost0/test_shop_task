import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int categoryId;
  final String title;
  final int createdAt;
  final int? parentCategoryId;
  final int updatedAt;
  final bool isPublic;
  final bool hasSubcategories;
  final String? description;
  final String? icon;

  const CategoryEntity({
    required this.categoryId,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    this.isPublic = true,
    this.hasSubcategories = true,
    this.parentCategoryId,
    this.description,
    this.icon,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [categoryId];
}
