// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NameEntity {

 int get id; String get name; bool get completed; bool get isHidden;
/// Create a copy of NameEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NameEntityCopyWith<NameEntity> get copyWith => _$NameEntityCopyWithImpl<NameEntity>(this as NameEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NameEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,completed,isHidden);

@override
String toString() {
  return 'NameEntity(id: $id, name: $name, completed: $completed, isHidden: $isHidden)';
}


}

/// @nodoc
abstract mixin class $NameEntityCopyWith<$Res>  {
  factory $NameEntityCopyWith(NameEntity value, $Res Function(NameEntity) _then) = _$NameEntityCopyWithImpl;
@useResult
$Res call({
 int id, String name, bool completed, bool isHidden
});




}
/// @nodoc
class _$NameEntityCopyWithImpl<$Res>
    implements $NameEntityCopyWith<$Res> {
  _$NameEntityCopyWithImpl(this._self, this._then);

  final NameEntity _self;
  final $Res Function(NameEntity) _then;

/// Create a copy of NameEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? completed = null,Object? isHidden = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NameEntity].
extension NameEntityPatterns on NameEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NameEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NameEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NameEntity value)  $default,){
final _that = this;
switch (_that) {
case _NameEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NameEntity value)?  $default,){
final _that = this;
switch (_that) {
case _NameEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  bool completed,  bool isHidden)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NameEntity() when $default != null:
return $default(_that.id,_that.name,_that.completed,_that.isHidden);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  bool completed,  bool isHidden)  $default,) {final _that = this;
switch (_that) {
case _NameEntity():
return $default(_that.id,_that.name,_that.completed,_that.isHidden);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  bool completed,  bool isHidden)?  $default,) {final _that = this;
switch (_that) {
case _NameEntity() when $default != null:
return $default(_that.id,_that.name,_that.completed,_that.isHidden);case _:
  return null;

}
}

}

/// @nodoc


class _NameEntity implements NameEntity {
  const _NameEntity({required this.id, required this.name, required this.completed, required this.isHidden});
  

@override final  int id;
@override final  String name;
@override final  bool completed;
@override final  bool isHidden;

/// Create a copy of NameEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NameEntityCopyWith<_NameEntity> get copyWith => __$NameEntityCopyWithImpl<_NameEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NameEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.isHidden, isHidden) || other.isHidden == isHidden));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,completed,isHidden);

@override
String toString() {
  return 'NameEntity(id: $id, name: $name, completed: $completed, isHidden: $isHidden)';
}


}

/// @nodoc
abstract mixin class _$NameEntityCopyWith<$Res> implements $NameEntityCopyWith<$Res> {
  factory _$NameEntityCopyWith(_NameEntity value, $Res Function(_NameEntity) _then) = __$NameEntityCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, bool completed, bool isHidden
});




}
/// @nodoc
class __$NameEntityCopyWithImpl<$Res>
    implements _$NameEntityCopyWith<$Res> {
  __$NameEntityCopyWithImpl(this._self, this._then);

  final _NameEntity _self;
  final $Res Function(_NameEntity) _then;

/// Create a copy of NameEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? completed = null,Object? isHidden = null,}) {
  return _then(_NameEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,isHidden: null == isHidden ? _self.isHidden : isHidden // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
