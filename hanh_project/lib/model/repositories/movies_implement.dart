import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hanh_project/model/data/results_response.dart';
import 'package:hanh_project/model/repositories/movies_repository.dart';

import '../network/api_client.dart';

final Provider<MoviesImplement> orderRepositoryImpProvider =
    Provider<MoviesImplement>(
  (Ref<MoviesImplement> ref) => MoviesImplement(ref.read),
);

class MoviesImplement implements MoviesRepository {
  MoviesImplement(this._reader);
  // ignore: prefer_typing_uninitialized_variables
  final _reader;

  @override
  Future<ResultsResponse> resultsResponse() async {
    final ResultsResponse response =
        await _reader(apiClientProvider).resultsResponse();
    return response;
  }
}
