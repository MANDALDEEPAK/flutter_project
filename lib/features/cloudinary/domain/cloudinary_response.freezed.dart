// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cloudinary_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CloudinaryResponse _$CloudinaryResponseFromJson(Map<String, dynamic> json) {
  return _CloudinaryResponse.fromJson(json);
}

/// @nodoc
mixin _$CloudinaryResponse {
  String get secure_url => throw _privateConstructorUsedError;
  String get public_id => throw _privateConstructorUsedError;

  /// Serializes this CloudinaryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CloudinaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CloudinaryResponseCopyWith<CloudinaryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CloudinaryResponseCopyWith<$Res> {
  factory $CloudinaryResponseCopyWith(
    CloudinaryResponse value,
    $Res Function(CloudinaryResponse) then,
  ) = _$CloudinaryResponseCopyWithImpl<$Res, CloudinaryResponse>;
  @useResult
  $Res call({String secure_url, String public_id});
}

/// @nodoc
class _$CloudinaryResponseCopyWithImpl<$Res, $Val extends CloudinaryResponse>
    implements $CloudinaryResponseCopyWith<$Res> {
  _$CloudinaryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CloudinaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? secure_url = null, Object? public_id = null}) {
    return _then(
      _value.copyWith(
            secure_url:
                null == secure_url
                    ? _value.secure_url
                    : secure_url // ignore: cast_nullable_to_non_nullable
                        as String,
            public_id:
                null == public_id
                    ? _value.public_id
                    : public_id // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CloudinaryResponseImplCopyWith<$Res>
    implements $CloudinaryResponseCopyWith<$Res> {
  factory _$$CloudinaryResponseImplCopyWith(
    _$CloudinaryResponseImpl value,
    $Res Function(_$CloudinaryResponseImpl) then,
  ) = __$$CloudinaryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String secure_url, String public_id});
}

/// @nodoc
class __$$CloudinaryResponseImplCopyWithImpl<$Res>
    extends _$CloudinaryResponseCopyWithImpl<$Res, _$CloudinaryResponseImpl>
    implements _$$CloudinaryResponseImplCopyWith<$Res> {
  __$$CloudinaryResponseImplCopyWithImpl(
    _$CloudinaryResponseImpl _value,
    $Res Function(_$CloudinaryResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CloudinaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? secure_url = null, Object? public_id = null}) {
    return _then(
      _$CloudinaryResponseImpl(
        secure_url:
            null == secure_url
                ? _value.secure_url
                : secure_url // ignore: cast_nullable_to_non_nullable
                    as String,
        public_id:
            null == public_id
                ? _value.public_id
                : public_id // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CloudinaryResponseImpl implements _CloudinaryResponse {
  const _$CloudinaryResponseImpl({
    required this.secure_url,
    required this.public_id,
  });

  factory _$CloudinaryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CloudinaryResponseImplFromJson(json);

  @override
  final String secure_url;
  @override
  final String public_id;

  @override
  String toString() {
    return 'CloudinaryResponse(secure_url: $secure_url, public_id: $public_id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloudinaryResponseImpl &&
            (identical(other.secure_url, secure_url) ||
                other.secure_url == secure_url) &&
            (identical(other.public_id, public_id) ||
                other.public_id == public_id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, secure_url, public_id);

  /// Create a copy of CloudinaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloudinaryResponseImplCopyWith<_$CloudinaryResponseImpl> get copyWith =>
      __$$CloudinaryResponseImplCopyWithImpl<_$CloudinaryResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CloudinaryResponseImplToJson(this);
  }
}

abstract class _CloudinaryResponse implements CloudinaryResponse {
  const factory _CloudinaryResponse({
    required final String secure_url,
    required final String public_id,
  }) = _$CloudinaryResponseImpl;

  factory _CloudinaryResponse.fromJson(Map<String, dynamic> json) =
      _$CloudinaryResponseImpl.fromJson;

  @override
  String get secure_url;
  @override
  String get public_id;

  /// Create a copy of CloudinaryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloudinaryResponseImplCopyWith<_$CloudinaryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
