import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hanh_project/model/data/movies_model.dart';

part 'results_response.freezed.dart';
part 'results_response.g.dart';

@freezed
abstract class ResultsResponse with _$ResultsResponse {
  const factory ResultsResponse({
    @Default([]) List<MoviesModel> results,
    @Default(0) int page,
  }) = _ResultsResponse;

  factory ResultsResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultsResponseFromJson(json);
}
