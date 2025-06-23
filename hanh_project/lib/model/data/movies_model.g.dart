// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesModel _$MoviesModelFromJson(Map<String, dynamic> json) => MoviesModel(
      title: json['title'] as String,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      overview: json['overview'] as String,
      backdropPath: json['backdrop_path'] as String,
    );

Map<String, dynamic> _$MoviesModelToJson(MoviesModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'overview': instance.overview,
      'backdrop_path': instance.backdropPath,
    };
