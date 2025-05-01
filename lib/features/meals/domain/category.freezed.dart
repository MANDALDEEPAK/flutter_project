// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return _CategoryData.fromJson(json);
}

/// @nodoc
mixin _$CategoryData {
  String get idCategory => throw _privateConstructorUsedError;
  String get strCategory => throw _privateConstructorUsedError;
  String get strCategoryThumb => throw _privateConstructorUsedError;
  String get strCategoryDescription => throw _privateConstructorUsedError;

  /// Serializes this CategoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDataCopyWith<CategoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataCopyWith<$Res> {
  factory $CategoryDataCopyWith(
    CategoryData value,
    $Res Function(CategoryData) then,
  ) = _$CategoryDataCopyWithImpl<$Res, CategoryData>;
  @useResult
  $Res call({
    String idCategory,
    String strCategory,
    String strCategoryThumb,
    String strCategoryDescription,
  });
}

/// @nodoc
class _$CategoryDataCopyWithImpl<$Res, $Val extends CategoryData>
    implements $CategoryDataCopyWith<$Res> {
  _$CategoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = null,
    Object? strCategoryDescription = null,
  }) {
    return _then(
      _value.copyWith(
            idCategory:
                null == idCategory
                    ? _value.idCategory
                    : idCategory // ignore: cast_nullable_to_non_nullable
                        as String,
            strCategory:
                null == strCategory
                    ? _value.strCategory
                    : strCategory // ignore: cast_nullable_to_non_nullable
                        as String,
            strCategoryThumb:
                null == strCategoryThumb
                    ? _value.strCategoryThumb
                    : strCategoryThumb // ignore: cast_nullable_to_non_nullable
                        as String,
            strCategoryDescription:
                null == strCategoryDescription
                    ? _value.strCategoryDescription
                    : strCategoryDescription // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryDataImplCopyWith<$Res>
    implements $CategoryDataCopyWith<$Res> {
  factory _$$CategoryDataImplCopyWith(
    _$CategoryDataImpl value,
    $Res Function(_$CategoryDataImpl) then,
  ) = __$$CategoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String idCategory,
    String strCategory,
    String strCategoryThumb,
    String strCategoryDescription,
  });
}

/// @nodoc
class __$$CategoryDataImplCopyWithImpl<$Res>
    extends _$CategoryDataCopyWithImpl<$Res, _$CategoryDataImpl>
    implements _$$CategoryDataImplCopyWith<$Res> {
  __$$CategoryDataImplCopyWithImpl(
    _$CategoryDataImpl _value,
    $Res Function(_$CategoryDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = null,
    Object? strCategoryDescription = null,
  }) {
    return _then(
      _$CategoryDataImpl(
        idCategory:
            null == idCategory
                ? _value.idCategory
                : idCategory // ignore: cast_nullable_to_non_nullable
                    as String,
        strCategory:
            null == strCategory
                ? _value.strCategory
                : strCategory // ignore: cast_nullable_to_non_nullable
                    as String,
        strCategoryThumb:
            null == strCategoryThumb
                ? _value.strCategoryThumb
                : strCategoryThumb // ignore: cast_nullable_to_non_nullable
                    as String,
        strCategoryDescription:
            null == strCategoryDescription
                ? _value.strCategoryDescription
                : strCategoryDescription // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataImpl implements _CategoryData {
  const _$CategoryDataImpl({
    required this.idCategory,
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  factory _$CategoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataImplFromJson(json);

  @override
  final String idCategory;
  @override
  final String strCategory;
  @override
  final String strCategoryThumb;
  @override
  final String strCategoryDescription;

  @override
  String toString() {
    return 'CategoryData(idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb, strCategoryDescription: $strCategoryDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataImpl &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb) &&
            (identical(other.strCategoryDescription, strCategoryDescription) ||
                other.strCategoryDescription == strCategoryDescription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    idCategory,
    strCategory,
    strCategoryThumb,
    strCategoryDescription,
  );

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      __$$CategoryDataImplCopyWithImpl<_$CategoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataImplToJson(this);
  }
}

abstract class _CategoryData implements CategoryData {
  const factory _CategoryData({
    required final String idCategory,
    required final String strCategory,
    required final String strCategoryThumb,
    required final String strCategoryDescription,
  }) = _$CategoryDataImpl;

  factory _CategoryData.fromJson(Map<String, dynamic> json) =
      _$CategoryDataImpl.fromJson;

  @override
  String get idCategory;
  @override
  String get strCategory;
  @override
  String get strCategoryThumb;
  @override
  String get strCategoryDescription;

  /// Create a copy of CategoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDataImplCopyWith<_$CategoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
