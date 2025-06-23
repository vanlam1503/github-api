import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanh_project/model/data/results_response.dart';
import 'package:hanh_project/model/repositories/movies_implement.dart';
import 'package:hanh_project/model/repositories/movies_repository.dart';

import 'movies_state.dart';

final AutoDisposeStateNotifierProvider<MoviesViewModel, MoviesSate>
    moviesViewModelProvider =
    StateNotifierProvider.autoDispose<MoviesViewModel, MoviesSate>(
  (Ref ref) {
    return MoviesViewModel(
      moviesRepository: MoviesImplement(ref.read),
    );
  },
);

class MoviesViewModel extends StateNotifier<MoviesSate> {
  MoviesViewModel({
    required this.moviesRepository,
  }) : super(MoviesSate());
  final MoviesRepository moviesRepository;
  Future<void> initSate() async {
    final ResultsResponse resultsResponse =
        await moviesRepository.resultsResponse();
    state = state.copyWith(
      movies: resultsResponse.results,
      page: resultsResponse.page,
    );
  }
}
