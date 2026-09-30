import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/name_entity.dart';

part 'name_state.freezed.dart';

@freezed
sealed class NameState with _$NameState {
  const factory NameState.initial() = _Initial;

  const factory NameState.loading() = _Loading;

  const factory NameState.loaded(
    List<NameEntity> names,
    int? editIndex,
    String? editName,
  ) = _Loaded;

  const factory NameState.error(
    String message,
  ) = _Error;
}