// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'my_theme_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyThemeData {
  Color? get appBarColor => throw _privateConstructorUsedError;

  set appBarColor(Color? value) => throw _privateConstructorUsedError;

  Color? get backGroundColor => throw _privateConstructorUsedError;

  set backGroundColor(Color? value) => throw _privateConstructorUsedError;

  Color? get appBarTitleTextColor => throw _privateConstructorUsedError;

  set appBarTitleTextColor(Color? value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyThemeDataCopyWith<MyThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyThemeDataCopyWith<$Res> {
  factory $MyThemeDataCopyWith(
          MyThemeData value, $Res Function(MyThemeData) then) =
      _$MyThemeDataCopyWithImpl<$Res>;

  $Res call(
      {Color? appBarColor,
      Color? backGroundColor,
      Color? appBarTitleTextColor});
}

/// @nodoc
class _$MyThemeDataCopyWithImpl<$Res> implements $MyThemeDataCopyWith<$Res> {
  _$MyThemeDataCopyWithImpl(this._value, this._then);

  final MyThemeData _value;

  // ignore: unused_field
  final $Res Function(MyThemeData) _then;

  @override
  $Res call({
    Object? appBarColor = freezed,
    Object? backGroundColor = freezed,
    Object? appBarTitleTextColor = freezed,
  }) {
    return _then(_value.copyWith(
      appBarColor: appBarColor == freezed
          ? _value.appBarColor
          : appBarColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      backGroundColor: backGroundColor == freezed
          ? _value.backGroundColor
          : backGroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      appBarTitleTextColor: appBarTitleTextColor == freezed
          ? _value.appBarTitleTextColor
          : appBarTitleTextColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
abstract class _$$_MyThemeDataCopyWith<$Res>
    implements $MyThemeDataCopyWith<$Res> {
  factory _$$_MyThemeDataCopyWith(
          _$_MyThemeData value, $Res Function(_$_MyThemeData) then) =
      __$$_MyThemeDataCopyWithImpl<$Res>;

  @override
  $Res call(
      {Color? appBarColor,
      Color? backGroundColor,
      Color? appBarTitleTextColor});
}

/// @nodoc
class __$$_MyThemeDataCopyWithImpl<$Res> extends _$MyThemeDataCopyWithImpl<$Res>
    implements _$$_MyThemeDataCopyWith<$Res> {
  __$$_MyThemeDataCopyWithImpl(
      _$_MyThemeData _value, $Res Function(_$_MyThemeData) _then)
      : super(_value, (v) => _then(v as _$_MyThemeData));

  @override
  _$_MyThemeData get _value => super._value as _$_MyThemeData;

  @override
  $Res call({
    Object? appBarColor = freezed,
    Object? backGroundColor = freezed,
    Object? appBarTitleTextColor = freezed,
  }) {
    return _then(_$_MyThemeData(
      appBarColor: appBarColor == freezed
          ? _value.appBarColor
          : appBarColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      backGroundColor: backGroundColor == freezed
          ? _value.backGroundColor
          : backGroundColor // ignore: cast_nullable_to_non_nullable
              as Color?,
      appBarTitleTextColor: appBarTitleTextColor == freezed
          ? _value.appBarTitleTextColor
          : appBarTitleTextColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$_MyThemeData implements _MyThemeData {
  _$_MyThemeData(
      {required this.appBarColor,
      required this.backGroundColor,
      required this.appBarTitleTextColor});

  @override
  Color? appBarColor;
  @override
  Color? backGroundColor;
  @override
  Color? appBarTitleTextColor;

  @override
  String toString() {
    return 'MyThemeData(appBarColor: $appBarColor, backGroundColor: $backGroundColor, appBarTitleTextColor: $appBarTitleTextColor)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_MyThemeDataCopyWith<_$_MyThemeData> get copyWith =>
      __$$_MyThemeDataCopyWithImpl<_$_MyThemeData>(this, _$identity);
}

abstract class _MyThemeData implements MyThemeData {
  factory _MyThemeData(
      {required Color? appBarColor,
      required Color? backGroundColor,
      required Color? appBarTitleTextColor}) = _$_MyThemeData;

  @override
  Color? get appBarColor;

  set appBarColor(Color? value);

  @override
  Color? get backGroundColor;

  set backGroundColor(Color? value);

  @override
  Color? get appBarTitleTextColor;

  set appBarTitleTextColor(Color? value);

  @override
  @JsonKey(ignore: true)
  _$$_MyThemeDataCopyWith<_$_MyThemeData> get copyWith =>
      throw _privateConstructorUsedError;
}
