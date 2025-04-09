// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'animate_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AnimateInstance _$AnimateInstanceFromJson(Map<String, dynamic> json) {
  return _AnimateInstance.fromJson(json);
}

/// @nodoc
mixin _$AnimateInstance {
  double get size => throw _privateConstructorUsedError;
  double get opacity => throw _privateConstructorUsedError;
  double get radius => throw _privateConstructorUsedError;

  /// Serializes this AnimateInstance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnimateInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnimateInstanceCopyWith<AnimateInstance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimateInstanceCopyWith<$Res> {
  factory $AnimateInstanceCopyWith(
    AnimateInstance value,
    $Res Function(AnimateInstance) then,
  ) = _$AnimateInstanceCopyWithImpl<$Res, AnimateInstance>;
  @useResult
  $Res call({double size, double opacity, double radius});
}

/// @nodoc
class _$AnimateInstanceCopyWithImpl<$Res, $Val extends AnimateInstance>
    implements $AnimateInstanceCopyWith<$Res> {
  _$AnimateInstanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnimateInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? opacity = null,
    Object? radius = null,
  }) {
    return _then(
      _value.copyWith(
            size:
                null == size
                    ? _value.size
                    : size // ignore: cast_nullable_to_non_nullable
                        as double,
            opacity:
                null == opacity
                    ? _value.opacity
                    : opacity // ignore: cast_nullable_to_non_nullable
                        as double,
            radius:
                null == radius
                    ? _value.radius
                    : radius // ignore: cast_nullable_to_non_nullable
                        as double,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AnimateInstanceImplCopyWith<$Res>
    implements $AnimateInstanceCopyWith<$Res> {
  factory _$$AnimateInstanceImplCopyWith(
    _$AnimateInstanceImpl value,
    $Res Function(_$AnimateInstanceImpl) then,
  ) = __$$AnimateInstanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double size, double opacity, double radius});
}

/// @nodoc
class __$$AnimateInstanceImplCopyWithImpl<$Res>
    extends _$AnimateInstanceCopyWithImpl<$Res, _$AnimateInstanceImpl>
    implements _$$AnimateInstanceImplCopyWith<$Res> {
  __$$AnimateInstanceImplCopyWithImpl(
    _$AnimateInstanceImpl _value,
    $Res Function(_$AnimateInstanceImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AnimateInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? opacity = null,
    Object? radius = null,
  }) {
    return _then(
      _$AnimateInstanceImpl(
        size:
            null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                    as double,
        opacity:
            null == opacity
                ? _value.opacity
                : opacity // ignore: cast_nullable_to_non_nullable
                    as double,
        radius:
            null == radius
                ? _value.radius
                : radius // ignore: cast_nullable_to_non_nullable
                    as double,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AnimateInstanceImpl implements _AnimateInstance {
  const _$AnimateInstanceImpl({
    required this.size,
    required this.opacity,
    required this.radius,
  });

  factory _$AnimateInstanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnimateInstanceImplFromJson(json);

  @override
  final double size;
  @override
  final double opacity;
  @override
  final double radius;

  @override
  String toString() {
    return 'AnimateInstance(size: $size, opacity: $opacity, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnimateInstanceImpl &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.opacity, opacity) || other.opacity == opacity) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, size, opacity, radius);

  /// Create a copy of AnimateInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnimateInstanceImplCopyWith<_$AnimateInstanceImpl> get copyWith =>
      __$$AnimateInstanceImplCopyWithImpl<_$AnimateInstanceImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AnimateInstanceImplToJson(this);
  }
}

abstract class _AnimateInstance implements AnimateInstance {
  const factory _AnimateInstance({
    required final double size,
    required final double opacity,
    required final double radius,
  }) = _$AnimateInstanceImpl;

  factory _AnimateInstance.fromJson(Map<String, dynamic> json) =
      _$AnimateInstanceImpl.fromJson;

  @override
  double get size;
  @override
  double get opacity;
  @override
  double get radius;

  /// Create a copy of AnimateInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnimateInstanceImplCopyWith<_$AnimateInstanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
