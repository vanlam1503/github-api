import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hanh_project/model/data/movies_model.dart';

part 'movies_state.freezed.dart';

@freezed
abstract class MoviesSate with _$MoviesSate {
  factory MoviesSate({
    @Default([]) List<MoviesModel> movies,
    @Default(0) int page,
  }) = _MoviesSate;
}
