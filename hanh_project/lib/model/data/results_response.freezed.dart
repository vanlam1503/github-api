// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultsResponse {
  List<MoviesModel> get results;
  int get page;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResultsResponseCopyWith<ResultsResponse> get copyWith =>
      _$ResultsResponseCopyWithImpl<ResultsResponse>(
          this as ResultsResponse, _$identity);

  /// Serializes this ResultsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResultsResponse &&
            const DeepCollectionEquality().equals(other.results, results) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(results), page);

  @override
  String toString() {
    return 'ResultsResponse(results: $results, page: $page)';
  }
}

/// @nodoc
abstract mixin class $ResultsResponseCopyWith<$Res> {
  factory $ResultsResponseCopyWith(
          ResultsResponse value, $Res Function(ResultsResponse) _then) =
      _$ResultsResponseCopyWithImpl;
  @useResult
  $Res call({List<MoviesModel> results, int page});
}

/// @nodoc
class _$ResultsResponseCopyWithImpl<$Res>
    implements $ResultsResponseCopyWith<$Res> {
  _$ResultsResponseCopyWithImpl(this._self, this._then);

  final ResultsResponse _self;
  final $Res Function(ResultsResponse) _then;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? page = null,
  }) {
    return _then(_self.copyWith(
      results: null == results
          ? _self.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MoviesModel>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ResultsResponse implements ResultsResponse {
  const _ResultsResponse(
      {final List<MoviesModel> results = const [], this.page = 0})
      : _results = results;
  factory _ResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultsResponseFromJson(json);

  final List<MoviesModel> _results;
  @override
  @JsonKey()
  List<MoviesModel> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  @JsonKey()
  final int page;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResultsResponseCopyWith<_ResultsResponse> get copyWith =>
      __$ResultsResponseCopyWithImpl<_ResultsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResultsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResultsResponse &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), page);

  @override
  String toString() {
    return 'ResultsResponse(results: $results, page: $page)';
  }
}

/// @nodoc
abstract mixin class _$ResultsResponseCopyWith<$Res>
    implements $ResultsResponseCopyWith<$Res> {
  factory _$ResultsResponseCopyWith(
          _ResultsResponse value, $Res Function(_ResultsResponse) _then) =
      __$ResultsResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<MoviesModel> results, int page});
}

/// @nodoc
class __$ResultsResponseCopyWithImpl<$Res>
    implements _$ResultsResponseCopyWith<$Res> {
  __$ResultsResponseCopyWithImpl(this._self, this._then);

  final _ResultsResponse _self;
  final $Res Function(_ResultsResponse) _then;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? results = null,
    Object? page = null,
  }) {
    return _then(_ResultsResponse(
      results: null == results
          ? _self._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<MoviesModel>,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
