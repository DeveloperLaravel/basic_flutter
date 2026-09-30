import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_entity.freezed.dart';

@freezed
abstract class NameEntity with _$NameEntity {
  const factory NameEntity({
    required int id,
    required String name,
    required bool completed,
    required bool isHidden,
  }) = _NameEntity;
}