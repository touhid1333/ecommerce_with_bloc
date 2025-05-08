// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvents {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialData,
    required TResult Function(int index, ProductModel product) addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchInitialData,
    TResult? Function(int index, ProductModel product)? addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialData,
    TResult Function(int index, ProductModel product)? addToCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchInitialData value) fetchInitialData,
    required TResult Function(AddToCart value) addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchInitialData value)? fetchInitialData,
    TResult? Function(AddToCart value)? addToCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchInitialData value)? fetchInitialData,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventsCopyWith<$Res> {
  factory $HomeEventsCopyWith(
          HomeEvents value, $Res Function(HomeEvents) then) =
      _$HomeEventsCopyWithImpl<$Res, HomeEvents>;
}

/// @nodoc
class _$HomeEventsCopyWithImpl<$Res, $Val extends HomeEvents>
    implements $HomeEventsCopyWith<$Res> {
  _$HomeEventsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchInitialDataImplCopyWith<$Res> {
  factory _$$FetchInitialDataImplCopyWith(_$FetchInitialDataImpl value,
          $Res Function(_$FetchInitialDataImpl) then) =
      __$$FetchInitialDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchInitialDataImplCopyWithImpl<$Res>
    extends _$HomeEventsCopyWithImpl<$Res, _$FetchInitialDataImpl>
    implements _$$FetchInitialDataImplCopyWith<$Res> {
  __$$FetchInitialDataImplCopyWithImpl(_$FetchInitialDataImpl _value,
      $Res Function(_$FetchInitialDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvents
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchInitialDataImpl implements FetchInitialData {
  const _$FetchInitialDataImpl();

  @override
  String toString() {
    return 'HomeEvents.fetchInitialData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchInitialDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialData,
    required TResult Function(int index, ProductModel product) addToCart,
  }) {
    return fetchInitialData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchInitialData,
    TResult? Function(int index, ProductModel product)? addToCart,
  }) {
    return fetchInitialData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialData,
    TResult Function(int index, ProductModel product)? addToCart,
    required TResult orElse(),
  }) {
    if (fetchInitialData != null) {
      return fetchInitialData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchInitialData value) fetchInitialData,
    required TResult Function(AddToCart value) addToCart,
  }) {
    return fetchInitialData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchInitialData value)? fetchInitialData,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    return fetchInitialData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchInitialData value)? fetchInitialData,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    if (fetchInitialData != null) {
      return fetchInitialData(this);
    }
    return orElse();
  }
}

abstract class FetchInitialData implements HomeEvents {
  const factory FetchInitialData() = _$FetchInitialDataImpl;
}

/// @nodoc
abstract class _$$AddToCartImplCopyWith<$Res> {
  factory _$$AddToCartImplCopyWith(
          _$AddToCartImpl value, $Res Function(_$AddToCartImpl) then) =
      __$$AddToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index, ProductModel product});
}

/// @nodoc
class __$$AddToCartImplCopyWithImpl<$Res>
    extends _$HomeEventsCopyWithImpl<$Res, _$AddToCartImpl>
    implements _$$AddToCartImplCopyWith<$Res> {
  __$$AddToCartImplCopyWithImpl(
      _$AddToCartImpl _value, $Res Function(_$AddToCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvents
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? product = null,
  }) {
    return _then(_$AddToCartImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
    ));
  }
}

/// @nodoc

class _$AddToCartImpl implements AddToCart {
  const _$AddToCartImpl({required this.index, required this.product});

  @override
  final int index;
  @override
  final ProductModel product;

  @override
  String toString() {
    return 'HomeEvents.addToCart(index: $index, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index, product);

  /// Create a copy of HomeEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      __$$AddToCartImplCopyWithImpl<_$AddToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchInitialData,
    required TResult Function(int index, ProductModel product) addToCart,
  }) {
    return addToCart(index, product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchInitialData,
    TResult? Function(int index, ProductModel product)? addToCart,
  }) {
    return addToCart?.call(index, product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchInitialData,
    TResult Function(int index, ProductModel product)? addToCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(index, product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchInitialData value) fetchInitialData,
    required TResult Function(AddToCart value) addToCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchInitialData value)? fetchInitialData,
    TResult? Function(AddToCart value)? addToCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchInitialData value)? fetchInitialData,
    TResult Function(AddToCart value)? addToCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class AddToCart implements HomeEvents {
  const factory AddToCart(
      {required final int index,
      required final ProductModel product}) = _$AddToCartImpl;

  int get index;
  ProductModel get product;

  /// Create a copy of HomeEvents
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
