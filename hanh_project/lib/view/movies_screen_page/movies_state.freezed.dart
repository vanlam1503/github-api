// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoviesSate {
  List<MoviesModel> get movies;
  int get page;

  /// Create a copy of MoviesSate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoviesSateCopyWith<MoviesSate> get copyWith =>
      _$MoviesSateCopyWithImpl<MoviesSate>(this as MoviesSate, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoviesSate &&
            const DeepCollectionEquality().equals(other.movies, movies) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(movies), page);

  @override
  String toString() {
    return 'MoviesSate(movies: $movies, page: $page)';
  }
}

/// @nodoc
abstract mixin class $MoviesSateCopyWith<$Res> {
  factory $MoviesSateCopyWith(
          MoviesSate value, $Res Function(MoviesSate) _then) =
      _$MoviesSateCopyWithImpl;
  @useResult
  $Res call({List<MoviesModel> movies, int page});
}

/// @nodoc
class _$MoviesSateCopyWithImpl<$Res> implements $MoviesSateCopyWith<$Res> {
  _$MoviesSateCopyWithImpl(this._self, this._then);

  final MoviesSate _self;
  final $Res Function(MoviesSate) _then;

  /// Create a copy of MoviesSate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = null,
    Object? page = null,
  }) {
    return _then(_self.copyWith(
      movies: null == movies
          ? _self.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MoviesModel>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _MoviesSate implements MoviesSate {
  _MoviesSate({final List<MoviesModel> movies = const [], this.page = 0})
      : _movies = movies;

  final List<MoviesModel> _movies;
  @override
  @JsonKey()
  List<MoviesModel> get movies {
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movies);
  }

  @override
  @JsonKey()
  final int page;

  /// Create a copy of MoviesSate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoviesSateCopyWith<_MoviesSate> get copyWith =>
      __$MoviesSateCopyWithImpl<_MoviesSate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoviesSate &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_movies), page);

  @override
  String toString() {
    return 'MoviesSate(movies: $movies, page: $page)';
  }
}

/// @nodoc
abstract mixin class _$MoviesSateCopyWith<$Res>
    implements $MoviesSateCopyWith<$Res> {
  factory _$MoviesSateCopyWith(
          _MoviesSate value, $Res Function(_MoviesSate) _then) =
      __$MoviesSateCopyWithImpl;
  @override
  @useResult
  $Res call({List<MoviesModel> movies, int page});
}

/// @nodoc
class __$MoviesSateCopyWithImpl<$Res> implements _$MoviesSateCopyWith<$Res> {
  __$MoviesSateCopyWithImpl(this._self, this._then);

  final _MoviesSate _self;
  final $Res Function(_MoviesSate) _then;

  /// Create a copy of MoviesSate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? movies = null,
    Object? page = null,
  }) {
    return _then(_MoviesSate(
      movies: null == movies
          ? _self._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MoviesModel>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
