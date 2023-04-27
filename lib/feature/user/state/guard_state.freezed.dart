// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GuardState {
  /// サインイン済みかどうか
  bool get signedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GuardStateCopyWith<GuardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuardStateCopyWith<$Res> {
  factory $GuardStateCopyWith(
          GuardState value, $Res Function(GuardState) then) =
      _$GuardStateCopyWithImpl<$Res, GuardState>;
  @useResult
  $Res call({bool signedIn});
}

/// @nodoc
class _$GuardStateCopyWithImpl<$Res, $Val extends GuardState>
    implements $GuardStateCopyWith<$Res> {
  _$GuardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
  }) {
    return _then(_value.copyWith(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuardStateCopyWith<$Res>
    implements $GuardStateCopyWith<$Res> {
  factory _$$_GuardStateCopyWith(
          _$_GuardState value, $Res Function(_$_GuardState) then) =
      __$$_GuardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool signedIn});
}

/// @nodoc
class __$$_GuardStateCopyWithImpl<$Res>
    extends _$GuardStateCopyWithImpl<$Res, _$_GuardState>
    implements _$$_GuardStateCopyWith<$Res> {
  __$$_GuardStateCopyWithImpl(
      _$_GuardState _value, $Res Function(_$_GuardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? signedIn = null,
  }) {
    return _then(_$_GuardState(
      signedIn: null == signedIn
          ? _value.signedIn
          : signedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_GuardState implements _GuardState {
  const _$_GuardState({required this.signedIn});

  /// サインイン済みかどうか
  @override
  final bool signedIn;

  @override
  String toString() {
    return 'GuardState(signedIn: $signedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuardState &&
            (identical(other.signedIn, signedIn) ||
                other.signedIn == signedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signedIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuardStateCopyWith<_$_GuardState> get copyWith =>
      __$$_GuardStateCopyWithImpl<_$_GuardState>(this, _$identity);
}

abstract class _GuardState implements GuardState {
  const factory _GuardState({required final bool signedIn}) = _$_GuardState;

  @override

  /// サインイン済みかどうか
  bool get signedIn;
  @override
  @JsonKey(ignore: true)
  _$$_GuardStateCopyWith<_$_GuardState> get copyWith =>
      throw _privateConstructorUsedError;
}
