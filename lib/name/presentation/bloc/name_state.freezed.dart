// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NameState {

 List<NameEntity> get names; int? get editIndex; String? get editName;
/// Create a copy of NameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NameStateCopyWith<NameState> get copyWith => _$NameStateCopyWithImpl<NameState>(this as NameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NameState&&const DeepCollectionEquality().equals(other.names, names)&&(identical(other.editIndex, editIndex) || other.editIndex == editIndex)&&(identical(other.editName, editName) || other.editName == editName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(names),editIndex,editName);

@override
String toString() {
  return 'NameState(names: $names, editIndex: $editIndex, editName: $editName)';
}


}

/// @nodoc
abstract mixin class $NameStateCopyWith<$Res>  {
  factory $NameStateCopyWith(NameState value, $Res Function(NameState) _then) = _$NameStateCopyWithImpl;
@useResult
$Res call({
 List<NameEntity> names, int? editIndex, String? editName
});




}
/// @nodoc
class _$NameStateCopyWithImpl<$Res>
    implements $NameStateCopyWith<$Res> {
  _$NameStateCopyWithImpl(this._self, this._then);

  final NameState _self;
  final $Res Function(NameState) _then;

/// Create a copy of NameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? names = null,Object? editIndex = freezed,Object? editName = freezed,}) {
  return _then(_self.copyWith(
names: null == names ? _self.names : names // ignore: cast_nullable_to_non_nullable
as List<NameEntity>,editIndex: freezed == editIndex ? _self.editIndex : editIndex // ignore: cast_nullable_to_non_nullable
as int?,editName: freezed == editName ? _self.editName : editName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NameState].
extension NameStatePatterns on NameState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NameState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NameState value)  $default,){
final _that = this;
switch (_that) {
case _NameState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NameState value)?  $default,){
final _that = this;
switch (_that) {
case _NameState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NameEntity> names,  int? editIndex,  String? editName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NameState() when $default != null:
return $default(_that.names,_that.editIndex,_that.editName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NameEntity> names,  int? editIndex,  String? editName)  $default,) {final _that = this;
switch (_that) {
case _NameState():
return $default(_that.names,_that.editIndex,_that.editName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NameEntity> names,  int? editIndex,  String? editName)?  $default,) {final _that = this;
switch (_that) {
case _NameState() when $default != null:
return $default(_that.names,_that.editIndex,_that.editName);case _:
  return null;

}
}

}

/// @nodoc


class _NameState implements NameState {
  const _NameState({required final  List<NameEntity> names, this.editIndex, this.editName}): _names = names;
  

 final  List<NameEntity> _names;
@override List<NameEntity> get names {
  if (_names is EqualUnmodifiableListView) return _names;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_names);
}

@override final  int? editIndex;
@override final  String? editName;

/// Create a copy of NameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameStateCopyWith<_NameState> get copyWith => __$NameStateCopyWithImpl<_NameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameState&&const DeepCollectionEquality().equals(other._names, _names)&&(identical(other.editIndex, editIndex) || other.editIndex == editIndex)&&(identical(other.editName, editName) || other.editName == editName));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_names),editIndex,editName);

@override
String toString() {
  return 'NameState(names: $names, editIndex: $editIndex, editName: $editName)';
}


}

/// @nodoc
abstract mixin class _$NameStateCopyWith<$Res> implements $NameStateCopyWith<$Res> {
  factory _$NameStateCopyWith(_NameState value, $Res Function(_NameState) _then) = __$NameStateCopyWithImpl;
@override @useResult
$Res call({
 List<NameEntity> names, int? editIndex, String? editName
});




}
/// @nodoc
class __$NameStateCopyWithImpl<$Res>
    implements _$NameStateCopyWith<$Res> {
  __$NameStateCopyWithImpl(this._self, this._then);

  final _NameState _self;
  final $Res Function(_NameState) _then;

/// Create a copy of NameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? names = null,Object? editIndex = freezed,Object? editName = freezed,}) {
  return _then(_NameState(
names: null == names ? _self._names : names // ignore: cast_nullable_to_non_nullable
as List<NameEntity>,editIndex: freezed == editIndex ? _self.editIndex : editIndex // ignore: cast_nullable_to_non_nullable
as int?,editName: freezed == editName ? _self.editName : editName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
