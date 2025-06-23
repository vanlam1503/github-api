// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResultsResponse _$ResultsResponseFromJson(Map<String, dynamic> json) =>
    _ResultsResponse(
      results: (json['results'] as List<dynamic>?)
              ?.map((e) => MoviesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      page: (json['page'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ResultsResponseToJson(_ResultsResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'page': instance.page,
    };
