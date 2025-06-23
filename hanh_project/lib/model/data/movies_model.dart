import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel {
  MoviesModel({
    required this.title,
    required this.posterPath,
    required this.releaseDate,
    required this.overview,
    required this.backdropPath,
  });

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'poster_path')
  final String posterPath;

  @JsonKey(name: 'release_date')
  final String releaseDate;

  @JsonKey(name: 'overview')
  final String overview;

  @JsonKey(name: 'backdrop_path')
  final String backdropPath;
}
