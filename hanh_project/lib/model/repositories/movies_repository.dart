import '../data/results_response.dart';

abstract class MoviesRepository {
  Future<ResultsResponse> resultsResponse();
}