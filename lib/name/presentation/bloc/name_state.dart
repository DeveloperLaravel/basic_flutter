import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/name_entity.dart';

part 'name_state.freezed.dart';

@freezed
abstract class NameState with _$NameState {
  const factory NameState({
    required List<NameEntity> names,
    int? editIndex,
    String? editName,
  }) = _NameState;
}